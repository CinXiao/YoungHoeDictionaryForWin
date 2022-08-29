import QtQuick 2.9
import Learn 1.0
Rectangle {

    id:root
    property int lv : 4
    property string textcolor : "#2b2b2b"
    property  string title : ""
    property alias textobj:text
    signal clickelesson(var self,var x,var y,var str);
    signal exit();
    width: 80
    height:120

    function updata()
    {
                 switch(lv)
                 {
                     case 0:
                     {img.source= "qrc:/DicProject/SVG/lv0.svg"
                         }return;
                     case 1:
                     {
                         text.font.bold=true
                         img.source= "qrc:/DicProject/SVG/lv1.svg"
                     }return;
                     case 2:
                     {

                         text.font.bold=true
                         img.source= "qrc:/DicProject/SVG/lv2.svg"
                     }return;


                }
                       text.font.bold=true
                        text.color="#FF8F3D"
                 img.source= "qrc:/DicProject/SVG/lv2.svg"
    }


    MouseArea
    {
     anchors.fill: parent
     onClicked:
     {
         root.clickelesson(root,root.x,root.y, text.text)

     }
     onExited:
     {

       root.exit()
     }
     hoverEnabled: true

    }

    Column
    {
        spacing: 10
        anchors.horizontalCenter: parent.horizontalCenter

        Image
        {
            id:img
         width: 80
         height:80
         source: ""
         mipmap: true
        }

        Text {
            id:text
            anchors.horizontalCenter: parent.horizontalCenter
            color:textcolor
            font.pointSize: 15
            font.family: "微软雅黑"
            text: title
        }

        }



}
