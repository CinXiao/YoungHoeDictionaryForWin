import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Window 2.15
import QtMultimedia 5.9
import GetInfo 1.0
import "DicProject"
import "DicProject/OtherWidget"

Window {



    InfoCore
    {
     id:softwearinfo
    }



    id:w
    minimumWidth:800

    minimumHeight: 600
    visible: true


    Component.onCompleted:
    {

         if(softwearinfo.getisfrist())
         {
            fristview.visible=true
         }else
         {
            fristview.visible=false
         }

    }




 MainWindow
 {

 }


 Begainpage
 {
     visible: false
     id:fristview
 }











}

