import QtQuick 2.9
import QtQuick.Controls 2.5
import Learn 1.0
import "../../BasicComponnet"
import "../javascript/LearnHome.js" as Pointer

Rectangle {
    property string textcolor: ""
    anchors.fill: parent
    id: root


    function finishedtest()
    {


         Pointer.obj.lv++;
 Pointer.obj.updata();
    }
    signal startLearn(var lessonname);

    property bool isvisit: false
    function clickeditem(self,x, y, str) {

         Pointer.obj=self;
        menu.x = x - 55
        menu.y = y + 80
        title.text = str
        if(self.lv>=3)
        {
         title.font.bold=true;
            title.color="#A8890C"

        }else
        {
         title.font.bold=false;
         title.color=textcolor
        }
        isvisit = true
    }
    function exit() {
        isvisit = false
    }

    LearnCore {
        id: learncore
    }

    ScrollView {
        id: scrollpage
        width: root.width
        height: root.height

        Column {
            anchors.left: parent.left
            anchors.leftMargin: root.width/2-200


            Rectangle {

                width: 200
                height: learncore.chaptersize()*120
                Rectangle {

                    id: lessonpage
                }
                //菜单
                Rectangle {
                    radius: 5
                    border.color: "#cccccc"
                    width: 200
                    height: 150
                    id: menu
                    visible: isvisit
                    z: 1
                    Text {
                        id: title
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: textcolor
                        font.pointSize: 15
                        font.family: "微软雅黑"

                    }
                    MouseArea {
                        anchors.fill: parent

                        hoverEnabled: true
                        onExited: {
                            isvisit = false
                        }
                        onEntered: {
                            isvisit = true
                        }
                    }
                    Column {
                        spacing: 15
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: title.bottom
                        anchors.topMargin: 20
                        Button {
                            text: "查看词汇"
                            z: 2
                            onEntered: {
                                isvisit = true
                            }
                        }
                        Button {
                            text: "开始"
                            z: 2
                            onEntered: {
                                isvisit = true
                            }
                            onClicked:
                            {
                                isvisit=false
                            root.startLearn(title.text);
                            }
                        }
                    }
                }


                Component.onCompleted: {

                    for (var i = 0; i < learncore.chaptersize(); ++i) {
                        var temp = Qt.createComponent(
                                    "../../BasicComponnet/LearnLessonItem.qml")
                        if (temp.status === Component.Ready) {
                            var item = temp.createObject(lessonpage, {
                                                             "title": learncore.getnextname(
                                                                          ),
                                                             "lv": learncore.getlv(
                                                                       ),
                                                             "x": Pointer.get_x(
                                                                      ),
                                                             "y": Pointer.get_y(
                                                                      )
                                                         })

                            item.clickelesson.connect(clickeditem)
                            item.exit.connect(exit)
                            item.updata();
                        }
                    }
                }
            }
        }
    }
}
