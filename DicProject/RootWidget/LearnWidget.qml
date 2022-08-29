import QtQuick 2.9
import QtQuick.Controls 2.5
import "../../BasicComponnet"
import "../OtherWidget"
import QtMultimedia 5.9
import Teach 1.0
import "../javascript/style.js" as Style
Item {
    anchors.fill: parent

    property  string textcolor :Style.getsunstyletext()
    property string rectcolor: Style.getsunstylerect()

    id:root
    signal startLearn(var lessonname);
    function finishedtest()
    {learnhome.finishedtest();

    }
function sun()
{
    textcolor=Style.getsunstyletext()
    rectcolor= Style.getsunstylerect()
    menubar.sun()
}


function moon()
{
    textcolor=Style.getmoonstyletext()
    rectcolor= Style.getmoonstylerect()
    menubar.moon()
}
     LMenu
     {
      id:menubar
     }



    SwipeView {
        id: view
        interactive: false
        clip: true
        currentIndex: menubar.currentIndex
        anchors {
            top: menubar.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        //首页
        Page
        {
            id:home

            LearnHome
            {
                color:rectcolor
                id:learnhome
                onStartLearn:
                {
                    root.startLearn(lessonname)
                }
            }

        }
        //阅读页面
        Page {
            ReadPage
            {
                color:rectcolor
                textcolor: textcolor
            }
        }

        //测试页面
        Page {
            TestPage
            {


                color:rectcolor
                textcolor: textcolor
            }
        }



    }
}
