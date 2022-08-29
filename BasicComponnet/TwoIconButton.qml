import QtQuick 2.9

Rectangle
{
   property bool isclicked: false
   property alias text:lable.text
   property string img1:""
   property string img2:""
   signal clicked1()
   signal clicked2()
   signal entered()
   signal exited()



    id:root
    width: 70
    height:70
    Column
    {

        id:rect
        spacing: 5
        width: 70
        height:70
        Image{
            anchors.horizontalCenter: parent.horizontalCenter
            source:img1
            width:30
            height: 30
            id:imge
            mipmap:true
        }

        Text{
            id:lable
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "微软雅黑"
            text:""
            font.bold: true
          font.pixelSize: 13
          color:"#949494"

          Behavior on color {
              ColorAnimation {
                  duration: 100
              }

          }
        }




    }
    MouseArea
    {
    hoverEnabled: true
    anchors.fill: parent
    onEntered:
    {

        root.entered()
    }
    onExited:
    {

        root.exited()
    }
    onClicked:
    {
        if(imge.source==img1)
        {
            root.clicked1();
            imge.source=img2

        }else
        {
          root.clicked2();
              imge.source=img1
        }

    }

    }
}
