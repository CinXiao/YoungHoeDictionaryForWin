import QtQuick 2.9
import QtQuick.Controls 2.5
import "../../BasicComponnet"
import "../OtherWidget"
import QtMultimedia 5.9
import Teach 1.0
import "../javascript/style.js" as Style
Rectangle {

    property string textcolor :Style.getsunstyletext()
    TeachCore {
        id: teachcore
    }

    anchors.fill: parent

    id: root

    function openunit(path) {

        // console.log(path)
        //view.currentIndex = 1
        teachcore.initlesson(path)
        listmodel.clear()
        for (var i = 0; i < teachcore.getlessoncount(); ++i) {
            listmodel.append({
                                 "lesson": teachcore.getlesson(i),
                                 "path": path + "/" + teachcore.getlesson(i)
                             })
        }
    }
      MenuBar {
          font.family: "微软雅黑"
          id:bar
          anchors {
              left: parent.left
              right: list.left

          }
          Component.onCompleted: {

              for (var i = 0; i < teachcore.getmenucount(); ++i) {

                  var temp = Qt.createComponent(
                              "../../BasicComponnet/Menubaritem.qml")
                  if (temp.status === Component.Ready) {

                      var menu = temp.createObject(bar, {
                                                       "title": teachcore.getmenu(
                                                                    i)
                                                   })
                      bar.addMenu(menu)

                      //  初始化菜单项
                      teachcore.initactive(teachcore.getmenu(i))
                      for (var j = 0; j < teachcore.getactivecount(); ++j) {

                          var tempaction = Qt.createComponent(
                                      "../../BasicComponnet/Actionitem.qml")

                          if (tempaction.status === Component.Ready) {

                              var action = tempaction.createObject(menu, {
                                                                       "text": teachcore.getactive(j),
                                                                       "path": teachcore.getmenu(i) + "/" + teachcore.getactive(j)
                                                                   })
                              menu.addAction(action)
                              action.openunit.connect(openunit)
                          }
                      }
                  }
              }
          }


      }

      ScrollView {

          clip: true
        id: textview
        width: parent.width *0.7
       anchors
       {
        top:bar.bottom
        bottom:parent.bottom
       }
        Column {
            spacing: 10
            Text {
                font.family: "微软雅黑"
                id: title
                text: ""
                font.bold: true
                font.pixelSize:20
            }
            TextEdit {

                font.family: "微软雅黑"
                width: textview.width - 5

                selectByMouse: true
                id: text
                wrapMode: Text.WordWrap
                color:textcolor

            }
        }
    }

    ListModel {
        id: listmodel
    }

    Component {
        id: listdelegate
        Rectangle {
            radius: 2
            width: lessonlist.width
            height: 25
            Text {
                id: lessontext
                anchors.left: parent.left
                anchors.leftMargin:5
                font.family: "微软雅黑"
                width: 200
                height: parent.height
                font.pixelSize: 10
                color: textcolor
                text: lesson
            }

            MouseArea {
                anchors.fill: parent

                hoverEnabled: true

                onEntered: {
                    parent.color = "#cccccc"
                }
                onExited: {
                    parent.color = "#ffffff"
                }
                onClicked: {
                  //  console.log(path)

                    text.text = teachcore.gettext(path)
                    title.text = lesson
                    player.source = teachcore.getaudiourl()
                    playbtn.deful()
                }
            }
        }
    }

    MediaPlayer {
        id: player
        source: ""
    }

    Rectangle {

        id: list
        height: parent.height
        border.color:rectcolor
        anchors {
            left: textview.right
            right: parent.right

        }
        ListView {
            clip: true
            id: lessonlist
            height: parent.height - 100
            width: parent.width
            model: listmodel
            delegate: listdelegate
            anchors.left: parent.left
            anchors.leftMargin: 2
            anchors.top: parent.top
            anchors.topMargin: 1
        }

        Rectangle {

            anchors.horizontalCenter: parent.horizontalCenter
            id: tools
            width: parent.width - 5
            color: rectcolor
            anchors {

                top: lessonlist.bottom
                topMargin: 5
                bottomMargin: 5
                bottom: parent.bottom
            }

            Column {
                anchors.horizontalCenter: parent.horizontalCenter

                Row {

                    Play_Stop_Btn {

                        id:playbtn
                        onPlaying: {
                            console.log("play")
                            player.play()
                        }
                        onStoped: {

                            player.pause()
                            console.log("stop")
                        }
                    }
                    Slider {
                        width: tools.width-50
                        value: player.position / player.duration
                    }


                }


            }
        }



    }




}
