import QtQuick 2.9

Rectangle
{

    property alias self: btn
    property alias text: lable.text
    property string color_text: "#ffffff"
    signal clicked()

    color: "#E8E8E8"
    id:btn
    height:parent.height
    Text {
        id:lable
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 15
        font.family: "微软雅黑"
        color:color_text
         text: "学习"
    }
    MouseArea
    {
           anchors.fill: parent
           onClicked:
           {
             btn.clicked()
           }
    }

}
