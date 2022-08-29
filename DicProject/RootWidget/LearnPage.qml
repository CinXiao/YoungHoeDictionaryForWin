import QtQuick 2.9
import QtQuick.Controls 2.5
import QtMultimedia 5.9
import Learn 1.0

import "../../BasicComponnet"

Rectangle
{
        anchors.fill: parent
        id:root
        signal closepage();
        signal finishedtest();
        property int count: 0
        property int finishedcount:0



        Audio
        {
         id:audio
         source: "qrc:/DicProject/wav/not.wav"

        }
        LearnCore
        {
         id:learncore

        }

        //初始化题目
        function initlesson(lesson)
        {

           learncore.getChapter(lesson)
            finishedcount=0;
            count=learncore.getChaptercount()
            loadtest()
             fnished.visible=false;

        }

        //加载题目

        function loadtest()
        {

            testtext.text=learncore.getrandtest()
            play.play()

           var type= learncore.gettype();
            switch(type)
            {
             case 0:{
                 title.text="请选择正确释义"
                 type0.visible=true;
                 type1.visible=false;

                 switch(learncore.randindex(4))
                 {
                     case 0:
                     {
                         btn1.text=learncore.getanswer();
                         btn2.text=learncore.getfalsequestion();
                         btn3.text=learncore.getfalsequestion();
                         btn4.text=learncore.getfalsequestion();
                     }break;
                     case 1:
                     {
                         btn1.text=learncore.getfalsequestion();
                         btn2.text=learncore.getanswer();
                         btn3.text=learncore.getfalsequestion();
                         btn4.text=learncore.getfalsequestion();

                     }break;
                     case 2:
                     {
                         btn1.text=learncore.getfalsequestion();
                         btn2.text=learncore.getfalsequestion();
                         btn3.text=learncore.getanswer();
                         btn4.text=learncore.getfalsequestion();

                     }break;
                     case 3:
                     {
                         btn1.text=learncore.getfalsequestion();
                         btn2.text=learncore.getfalsequestion();
                         btn3.text=learncore.getfalsequestion();
                         btn4.text=learncore.getanswer();
                     }break;
                }

             }break;

             case 1:{
                   title.text="请填写正确释义"
                 textinput.text="";
                 textinput.focus=true;
                 type0.visible=false;
                 type1.visible=true;

             }break;

            }


        }

        //判断并且更新题目
        function uptest(str)
        {
            //正确
                if(learncore.judge(str))
                {
                    finishedcount++;
                        if(finishedcount==count)
                        {


                                type0.visible=false
                                type1.visible=false
                                fnished.visible=true;
                                audio.source="qrc:/DicProject/wav/finished.wav"
                                audio.play()

                            return;
                        }else
                        {

                            audio.source="qrc:/DicProject/wav/ok.wav"
                             audio.play();
                        }
                        loadtest()
                }
                else
                {
                    audio.source="qrc:/DicProject/wav/not.wav"
                    audio.play()
                    tip.text="正确答案: "+learncore.getanswer()
                    falseview.visible=true
                    type0.visible=false
                    type1.visible=false
                    return;


                    }

        }


         Row
         {
          spacing: 10
          id:slder
          CloseButton
          {
              onClicked: {
                  root.closepage()
              }
          }

          Rectangle
          {
              anchors.verticalCenter: parent.verticalCenter
             height: 20
             radius:10
             width: root.width-100
             border.color: "#cccccc"
             Rectangle
             {
                anchors.verticalCenter: parent.verticalCenter
                radius:10
                id:sback
                height:parent.height
                width:parent.width*(finishedcount/count);
                color: "#5EC94E"

               Behavior on width
               {

                   NumberAnimation {
                       duration: 200
                       easing.type: Easing.InOutQuad
                   }

               }
             }
          }
         }




                     Column
                     {
                       spacing: 15
                       anchors.right: parent.horizontalCenter
                       anchors.top: slder.bottom
                       anchors.topMargin: 30
                       id:qustion
                         Text {
                             id: title
                             color: "#696969"
                             font.bold: true
                             font.family: "微软雅黑"
                             font.pointSize: 20
                             text: "请选择正确释义"
                         }

                         Row{

                             PlayBtn
                             {
                                id:play
                                audio:testtext.text
                             }
                         Text
                         {
                             id:testtext
                             color: "#2B2B2B"
                             font.bold: true
                             font.family: "微软雅黑"
                             font.pointSize: 35
                             text: "Hello"
                         }
                            }
                    }


                     Column
                     {
                        id:type0
                        spacing: 10
                        anchors.bottom:  root.bottom
                        anchors.bottomMargin: 50
                        anchors.horizontalCenter: parent.horizontalCenter
                        Rectangle
                        {

                          width: 300
                          height: 300
                          Column
                          {

                              spacing: 5
                              SelectBtn
                              {
                                  id:btn1
                               onClicked:
                               {
                                 root.uptest(btn1.text)
                               }
                              }
                              SelectBtn
                              {
                                  id:btn2
                               onClicked:
                               {
                                 root.uptest(btn2.text)
                               }
                              }
                              SelectBtn
                              {
                                  id:btn3
                               onClicked:
                               {
                                 root.uptest(btn3.text)
                               }
                              }
                              SelectBtn
                              {
                                  id:btn4
                               onClicked:
                               {
                                 root.uptest(btn4.text)
                               }
                              }
                          }

                        }




                        }




                     Rectangle
                     {


                         id:type1
                         width:600
                         height: 300
                         radius: 5
                         anchors.horizontalCenter: parent.horizontalCenter
                         anchors.bottom: parent.bottom
                         anchors.bottomMargin: 50
                         color:"#ffffff"
                         border.color: "#cccccc"
                         TextInput
                         {
                             id:textinput
                          enabled: true
                          selectByMouse: true
                          font.bold: true
                          font.family: "微软雅黑"
                          anchors.left: parent.left
                          anchors.right: parent.right
                          anchors.leftMargin: 5
                          anchors.rightMargin: 5
                          anchors.top: parent.top
                          anchors.bottom: parent.bottom
                          anchors.topMargin: 3
                          color:"#696969"
                          font.pointSize: 25


                         }


                         Button
                         {
                             anchors.right: parent.right
                             anchors.bottom: parent.bottom
                            anchors.rightMargin: 3
                            anchors.bottomMargin: 3
                          text: "确定"
                          onClicked:
                          {
                            root.uptest(textinput.text)
                          }

                         }
                     }


                     Rectangle
                     {
                         id:falseview

                         height:350
                         visible:false
                         radius: 5
                         width:400
                         border.color: "#A8302D"
                         anchors
                         {

                            horizontalCenter:parent.horizontalCenter
                            bottom:parent.bottom
                            bottomMargin:20


                         }
                         Column
                         {
                             spacing: 5
                             Text {
                                 color: "#A8302D"
                                 font.bold: true
                                 font.family: "微软雅黑"
                                 font.pointSize:35
                                 text: "答案错误"
                             }

                             Text {
                                 color: "#696969"
                                 id:tip
                                 font.bold: true
                                 font.family: "微软雅黑"
                                 font.pointSize:25
                                 text: "正确答案:"
                             }

                         }


                         Button
                         {
                           anchors.right: parent.right
                          anchors.bottom: parent.bottom
                          anchors.rightMargin: 3
                          anchors.bottomMargin: 3
                          text: "记住了"
                          onClicked:
                          {
                              root.loadtest()
                              falseview.visible=false

                          }

                         }

                     }

                     Rectangle
                     {
                         id:fnished
                         visible: false
                         anchors.fill: parent


                         Column
                         {
                           spacing: 30
                           anchors.centerIn: parent
                             Text {
                                 color: "#49B328"
                                 font.bold: true
                                 font.family: "微软雅黑"
                                 font.pointSize:35
                                 text: "恭喜通关!!"
                             }

                             Button
                             {
                               text: "确定"

                               onClicked:
                               {
                                   learncore.pulslv(learncore.getname());
                                   root.closepage()
                                   root.finishedtest();
                               }
                             }



                          }
                        }



}
