import QtQuick 2.9
import "RootWidget"
Item {
    anchors.fill: parent



    TopPage
    {
        id:toppage
        z:2
        visible: false
    onFinishedtest:
    {
            weidget.finishedtest()
    }
    }



Rectangle
{
    color:"#F7F7F7"
    anchors.fill: parent


  Menu
  {
        id:menu
       height: parent.height
       width:70
        anchors
        {
        left:parent.left
        top:parent.top
        bottom:parent.bottom
        }

    onStylechange:
    {
     if(sty==="sun")
     {
       weidget.changestyletosun()
     }
     if(sty==="moon")
     {
        weidget.changestyletomoon()
     }

    }

   }

  MainWeidget
  {
      courrentindex: menu.current
      id:weidget
      anchors
      {
       left:menu.right
       top:parent.top
       bottom:parent.bottom
       right:parent.right
      }


      onStartLearn:
      {
         toppage.visible=true
         toppage.startLearn(lessonname)
      }
  }



}
}
