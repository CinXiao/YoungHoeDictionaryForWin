import QtQuick 2.9
import QtQuick.Controls 2.5

Item {


    width:parent.width
    height: 100

   Column
   {
       spacing: 20

       width: parent.width
       height: parent.height

       Rectangle
       {
             anchors.horizontalCenter: parent.horizontalCenter
       width: 35
       height: 35
       radius:20
       color:"#cccccc"

       }

       Image {
           anchors.horizontalCenter: parent.horizontalCenter
           id: seting
           mipmap:true
           width: 30
           height:30
           source: "qrc:/DicProject/ico/seting1.png"
       }


   }

}
