import QtQuick 2.9



Image
{
    width:40
    height:40

    property bool iscollect: false
    signal clicked()
    id:root
    mipmap: true
    source:iscollect?"../DicProject/ico/start2.png":"../DicProject/ico/start1.png"
    MouseArea{
    anchors.fill: parent
    hoverEnabled: true


   onClicked:
    {
        root.clicked()
    }



}
}


