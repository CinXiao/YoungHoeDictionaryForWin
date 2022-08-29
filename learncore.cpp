#include "learncore.h"
#include<QDomDocument>
static QVector<Chapter> chapter;
static bool isinit=false;
static int name_count=0;
void init()
{


    if(!isinit)
    {
        chapter.clear();
        qsrand(QTime(0,0,0).secsTo(QTime::currentTime()));
        QFile file("Learn/English.xml");
        file.open(QIODevice::ReadOnly);
        QDomDocument doc;
        doc.setContent(&file);
        QDomNode root=doc.firstChild();
        QDomNode item=root.firstChild();
        while(!item.isNull())
        {
            Chapter u;
            QString lv=item.toElement().attribute("lv");
            u.lv=lv.toInt();
            u.name=item.firstChildElement().text();

            QDomNode p=item.firstChildElement().nextSibling().firstChildElement();

            if(u.lv==0)
            {
                while(!p.isNull())
                {
                    TestPoint contain;
                    contain.Q=p.firstChildElement().text();
                    contain.A=p.firstChildElement().nextSiblingElement().text();
                    contain.type=p.toElement().attribute("type").toInt();
                    u.points.push_back(contain);
                    p=p.nextSibling();
                }

            }else if(u.lv==1)
            {
                while(!p.isNull())
                {
                    TestPoint contain,contain2;
                    contain.Q=p.firstChildElement().text();
                    contain.A=p.firstChildElement().nextSiblingElement().text();
                    contain.type=p.toElement().attribute("type").toInt();
                    qSwap(contain.A,contain.Q);
                    contain2=contain;
                    contain2.type=1;
                    u.points.push_back(contain2);
                    u.points.push_back(contain);
                    p=p.nextSibling();
                }
            }else if(u.lv==2)
            {
                while(!p.isNull())
                {
                    TestPoint contain,contain2;
                    contain.Q=p.firstChildElement().text();
                    contain.A=p.firstChildElement().nextSiblingElement().text();
                    contain.type=p.toElement().attribute("type").toInt();
                    contain2=contain;
                    contain2.type=1;
                    u.points.push_back(contain2);
                    u.points.push_back(contain);
                    p=p.nextSibling();
                }
            }else
            {
                while(!p.isNull())
                {
                    TestPoint contain,contain2,contain3,contain4;
                    contain.Q=p.firstChildElement().text();
                    contain.A=p.firstChildElement().nextSiblingElement().text();
                    contain.type=1;
                    contain2=contain;
                    contain2.type=1;
                    contain3.A=contain.Q;
                    contain3.Q=contain.A;
                    contain3.type=1;
                    u.points.push_back(contain3);
                    u.points.push_back(contain2);
                    u.points.push_back(contain);
                    p=p.nextSibling();
                }

            }
            u.count=u.points.size();
            chapter.push_back(u);
            item=item.nextSibling();
        }
            file.close();
    }
    isinit=true;

}

void LearnCore::pulslv(QString lesson)
{
    QFile file("Learn/English.xml");
    file.open(QIODevice::ReadOnly);
    QDomDocument doc;
    doc.setContent(&file);
    file.close();
    QDomNode root=doc.firstChild();
    QDomNode item=root.firstChild();
    while(!item.isNull())
    {

        if(item.firstChild().toElement().text()==lesson)
        {
            item.toElement().setAttribute("lv",item.toElement().attribute("lv").toInt()+1);
            file.open(QIODevice::WriteOnly);

            file.write(doc.toByteArray());
                      file.close();
            break;
        }

       item=item.nextSibling();
    }
    isinit=false;
    init();
}


QString LearnCore::getnextname()
{
    int temp=name_count;

    qDebug()<<temp;
    if(temp<chaptersize())
    {
        name_count++;
        return chapter[temp].name;
    }
    return "NULL";

}
int LearnCore::getlv()
{
    return chapter[name_count-1].lv;
}

QString LearnCore::getname()
{
    return current.name;
}
int LearnCore::chaptersize()
{
    return chapter.size();
}
QString LearnCore::getpath(QString name)
{

    return "file:///"+QDir::currentPath()+"/Learn/English/Menu/"+name+".svg";
}

LearnCore::LearnCore()
{
    init();//初始化
}


 void LearnCore::getChapter(QString lesson)
 {

     indexs.clear();
    for(int i=0;i<chapter.size();++i)
    {

        if(chapter[i].name==lesson)
        {
            current=chapter[i];
            TestCount=current.count;
            break;
        }

    }
 }


  bool LearnCore::issave(int index)
  {
     for(int i=0;i<indexs.size();++i)
      {
          if(indexs[i]==index)return true;
      }
      return false;
   }


  //随机一题
 QString LearnCore::getrandtest()
 {

     int rand=qrand()%TestCount;
     falseanswers.clear();
     while(issave(rand))
     {
         rand=qrand()%TestCount;
     }
     indexs.push_back(rand);
     currentpoint=current.points[rand];


     //falseanswers.push_back();

     for(int i=0;i<3;++i)
     {

          rand=qrand()%TestCount;
          if(TestCount<4)
          {

              break;
          }
         while(answerissave(current.points[rand].A))
         {
            rand=qrand()%TestCount;
         }
        falseanswers.push_back(current.points[rand].A);
      }
     return currentpoint.Q;
 }


bool LearnCore::answerissave (QString A)
{
    if(A==currentpoint.A)return true;
    for(int i=0;i<falseanswers.size();++i)
    {
        if(A==falseanswers[i])
        {
           return true;
       }
    }
 return false;
}


int LearnCore::gettype()
{

return currentpoint.type;
}
    QString LearnCore::getanswer()
    {


            return  currentpoint.A;
    }
 //判断答案
 bool LearnCore::judge(QString str)
 {

    str=str.replace(" ","");
    qDebug()<<str;
   switch(currentpoint.type)
   {

             case 0:
           {
               if(str==currentpoint.A)
               {
                   return true;
               }
           }break;

           case 1:
           {
               if(str==currentpoint.A)
               {
                   return true;
               }else if(str.contains(currentpoint.A)&&str.size()<=currentpoint.A.size()*2)
               {
                    return true;

               }

           }

    }
if(!indexs.isEmpty()) indexs.pop_back();
return false;
 }

  QString LearnCore::getquestion()
  {
        return currentpoint.Q;
  }
 int LearnCore::getChaptercount()
 {

     return TestCount;
 }

QString LearnCore::getfalsequestion()
{

    if(falseanswers.size()==0)return "NULL";
    QString temp=falseanswers[falseanswers.size()-1];
    falseanswers.pop_back();
    return temp;
}

int  LearnCore::randindex(int range)
{
        int rand=qrand()%range;

        qDebug()<<"rand index"<<rand;
        return rand;
}
