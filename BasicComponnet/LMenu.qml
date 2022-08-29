import QtQuick 2.15
import QtQuick.Controls 2.5
import "../DicProject/javascript/style.js" as Style
Rectangle
{

    property int currentIndex:0
    property int count: 3
    property int sizewidth: 300
    id:root
    width:parent.width
    height:50
    border.color: "#cccccc"
    color: rectcolor
    property string rectcolor:Style.getsunstylerect()

    property string _textcolor:Style.getsunstyletext()
    function sun()
    {
       rectcolor=Style.getsunstylerect()
_textcolor=Style.getsunstyletext()
    }

    function moon()
    {
        rectcolor=Style.getmoonstylerect()
        _textcolor=Style.getmoonstyletext()
    }

    Rectangle
    {

        id:selecter
        z:1
        width:sizewidth/count
        height:parent.height-3
        anchors.verticalCenter: parent.verticalCenter
        color: "#3282F6"
        radius: 5
        Text {
            id:t
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 15
            font.family: "微软雅黑"
            color: "#ffffff"
            text:"学习"

        }

        Behavior on x
        {

            NumberAnimation
            {
                duration: 500
                easing.type: "OutQuart"

            }

        }
    }

    function moveto(obj,objtext,index)
    {

        selecter.x=obj.x;
        t.text=objtext;
        currentIndex=index;
    }









    Row
    {
        anchors.fill: parent


        MenuButton
        {
            text: "学习"
            color_text: _textcolor
            color: root.color
            width: sizewidth/count
            height:parent.height-3
            anchors.verticalCenter: parent.verticalCenter
            onClicked:
            {
             moveto(self,text,0)
            }
        }

        MenuButton
        {
             text: "阅读"
              color: root.color
                color_text: _textcolor
            width: sizewidth/count
            height:parent.height-3
            anchors.verticalCenter: parent.verticalCenter
            onClicked:
            {
             moveto(self,text,1)
            }
        }
        MenuButton
        {
             text: "单词"
               color_text: _textcolor
              color: root.color
            width: sizewidth/count
            height:parent.height-3
            anchors.verticalCenter: parent.verticalCenter
            onClicked:
            {
             moveto(self,text,2)
            }
        }


    }



}

