#ifndef LEARNCORE_H
#define LEARNCORE_H

#include <QObject>
#include<QDomDocument>
#include<QDir>
#include<QFile>
#include<QDebug>
#include<QTime>
class TestPoint
{

public :
    int type;//类型{0：单词选择 1：句子选择 2：单词拼写 3：单词翻译 4：句子翻译}
    QString Q;
    QString A;
};


class Chapter
{
public:
    QString name="";
    QString img="";
    int count=0;
    int lv=0;
    QVector<TestPoint> points;
};


class LearnCore:public QObject
{
    Q_OBJECT
public:
    LearnCore();
private:


public slots:
    QString getpath(QString name);
    QString getnextname();
    QString getname();
    int getlv();
    int chaptersize();
    void getChapter(QString lesson);
    int getChaptercount();

    //升级后增加等级
    void pulslv(QString lesson);

    //随机一题
    QString getrandtest();

    //随机选线编号
    int randindex(int range);

    //获取题目类型
    int gettype();
    //判断
    bool judge(QString str);

    //获取答案
    QString getanswer();

    //获取问题
    QString getquestion();

    //获取错误答案
    QString getfalsequestion();


private:
    bool issave (int index);
    bool answerissave (QString A);
    Chapter current;
    TestPoint currentpoint;
    int TestCount=0;
    QVector<int> indexs;
    QVector<QString> falseanswers;
    QString currenttest="",currentanswer="";


};

#endif // LEARNCORE_H
