import QtQuick 2.9
import QtQuick.Controls 2.5
Rectangle {

    id:root
    width:70
    height: 50
    property  alias  text: t.text
    property string img :""
     property bool isclicked :false
    signal clicked();
    signal exited();
    signal entered();

    Component.onCompleted:
    {
 exit();

    }

    function exit()
    {
        if(isclicked)
        {
         root.state="checked"
        }else
        {
           root.state="init"
        }

    }



    states: [
        State {
            name: "init"
            PropertyChanges {
                target: imge
                 source:img+"1.png"

            }
            PropertyChanges {
                target: t
                color:"#696969"

            }
        },
        State {
            name: "checked"
            PropertyChanges {
                target: imge
                source:img+"2.png"
            }
            PropertyChanges {
                target: t
                color:"#3282F6"

            }

        }
    ]
    Column{


        spacing: 5
        anchors.horizontalCenter: parent.horizontalCenter
    Image
    {
         mipmap:true
        width: 30
        height: 30
        source:img+"1.png"
        id:imge
  anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {

        id:t
        font.family: "微软雅黑"
        font.bold: true
        font.pointSize: 10
        color: "#696969"
        text: ""
        anchors.horizontalCenter: parent.horizontalCenter

        Behavior on color{
            ColorAnimation {
                duration: 200
            }
        }
    }
    }
    MouseArea
    {
        hoverEnabled: true
           anchors.fill: parent
           onClicked:
           {
               root.clicked()
           }
           onEntered:
           {
               root.entered()
               t.color="#3282F6"
           }
           onExited:
           {
               if(!isclicked)t.color="#696969"
               root.exited()
           }


    }


}
