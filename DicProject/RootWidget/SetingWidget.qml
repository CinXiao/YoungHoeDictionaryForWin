import QtQuick 2.9
import QtQuick.Controls 2.5

import "../javascript/style.js" as Style
Rectangle {


    id:root
    property  string textcolor :Style.getsunstyletext()
    property string rectcolor: Style.getsunstylerect()
    function sun()
    {
        rectcolor=Style.getsunstylerect()
        textcolor=Style.getsunstyletext()
    }

    function moon()
    {
        rectcolor=Style.getmoonstylerect()
        textcolor=Style.getmoonstyletext()
    }


    color:rectcolor

    anchors.fill: parent


        Column
        {
                 spacing: 15
         Row
         {

             spacing: 15
            Image
            {
             source: "qrc:/ico.png"
            }
          Column
          {
              anchors.verticalCenter: parent.verticalCenter
              spacing: 15
            Text {
                font.family: "微软雅黑"
                font.pointSize:18
                text:"YoungHoe英语词典 0.7"
                font.bold: true
                color: textcolor
            }
            Text {
                color: textcolor
                font.family: "微软雅黑"
                font.pointSize: 15
                text:"YoungHoeEnglishDictionary 0.7"
            }
            }



         }


         Text {

                color: textcolor
                font.family: "微软雅黑"
                font.pointSize: 20
                font.bold: true
                text:"开源地址"
            }





          Text {
                 color: textcolor
                 font.family: "微软雅黑"
                 font.pointSize: 15
                 text:"<img src='https://avatars.githubusercontent.com/u/54227677?s=16&v=4'></img>YoungHoe"
                 MouseArea
                 {
                 anchors.fill: parent
                 onClicked:
                 {
                    Qt.openUrlExternally("https://github.com/CinXiao/YoungHoeENDictionary")
                 }
                 }
             }
          Text {

                 color: textcolor
                 font.family: "微软雅黑"
                 font.pointSize:20
                   font.bold: true
                 text:"其他学习资源"
             }
          Text {
                 color: textcolor
                 font.family: "微软雅黑"
                 font.pointSize: 15
                 text:"<img src='https://s.cn.bing.net/th?id=ODLS.aaf6e98a-bf18-4aff-808c-50852a2f93d1&w=16&h=16&o=6&pid=1.2'><img>多领国"
                 MouseArea
                 {
                 anchors.fill: parent
                 onClicked:
                 {
                    Qt.openUrlExternally("https://www.duolingo.com/")
                 }
                 }
          }
          Text {
                 color: textcolor
                 font.family: "微软雅黑"
                 font.pointSize: 15
                 text:"<img src='https://s.cn.bing.net/th?id=ODLS.eff3ae50-ce7d-4b39-bf33-71cfb85a30bd&w=16&h=16&o=6&pid=1.2'><img>博树 Busuu"
                 MouseArea
                 {
                 anchors.fill: parent
                 onClicked:
                 {
                    Qt.openUrlExternally("https://www.busuu.com/zh")
                 }
                 }
          }

        }


}
