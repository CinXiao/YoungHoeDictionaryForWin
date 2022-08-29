import QtQuick 2.9
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.15
import "../BasicComponnet"
import "javascript/style.js" as Style
Item {

    property int current: 0
    id: root



    signal stylechange(var sty)

    function changepage(index) {
        switch (index) {
        case 0:
        {
            home.isclicked=true;
            learn.isclicked=false;
            book.isclicked=false;
            start.isclicked=false;
            seting.isclicked=false;

        }
        break
        case 1:
        {

            home.isclicked=false;
            learn.isclicked=true;
            book.isclicked=false;
            start.isclicked=false;
             seting.isclicked=false;
        }
        break
        case 2:
        {
            home.isclicked=false;
            learn.isclicked=false;
            book.isclicked=true;
            start.isclicked=false;
             seting.isclicked=false;
        }
        break
        case 3:
        {
            home.isclicked=false;
            learn.isclicked=false;
            book.isclicked=false;
            start.isclicked=true;
             seting.isclicked=false;
        }
        break
        case 5:
        {
            home.isclicked=false;
            learn.isclicked=false;
            book.isclicked=false;
            start.isclicked=false;
             seting.isclicked=true;

        }
        }

        home.exit();
        learn.exit();
        book.exit();
        start.exit();
         seting.exit();
    }
    Rectangle {

        id: menubar
        color: "#ffffff"
        width: root.width
        height: root.height
        radius: 5
        clip: true




        Column {

            spacing: 30
            MenuItem {
                img: "qrc:/DicProject/ico/home"
                text: "首页"
                id: home
                isclicked: true

                onClicked: {
                    current = 0
                     root.changepage(current)
                  exit()
                }

                onExited: {
                    exit()
                }
            }

            MenuItem {
                img: "qrc:/DicProject/ico/learn"
                text: "练习"
                id: learn
                onClicked: {
                    current = 1
                     root.changepage(current)
                   exit()
                }

            }
            MenuItem {
                img: "qrc:/DicProject/ico/book"
                text: "词典"
                id: book
                onClicked: {
                    current = 2
                     root.changepage(current)
                     exit()
                }


            }
            MenuItem {
                img: "qrc:/DicProject/ico/start"
                text: "收藏"
                id: start
                onClicked: {
                    current = 3
                  root.changepage(current)
                   exit()
                }
            }
        }

        //登陆，设置，工具
     Column
     {


         height:150

        anchors.bottom: parent.bottom
        anchors.bottomMargin:  -40
        spacing: -10




        TwoIconButton
        {

            img1: "qrc:/DicProject/SVG/sun.svg"
            img2: "qrc:/DicProject/SVG/moon.svg"
            id:stylebtn

            onClicked1:
            {
             //   Style.stylemooon()
             //   root.stylechange("moon")

            }
            onClicked2:
            {
            //  Style.stylesun()
            //  root.stylechange("sun")
            }
        }

        MenuItem {
            img: "qrc:/DicProject/ico/seting"
            id: seting
            onClicked: {
              current = 5
              root.changepage(current)
               exit()
            }

            onExited: {
                exit()
            }
        }

     }

        //左边栏
        Rectangle {
            color: "#cccccc"
            id:leftlan
            height: parent.height
            width: 1
            anchors.right: parent.right
            anchors.rightMargin: 3

        }

        //添加组件给样式管理器
        Component.onCompleted:
        {
            Style.addRectangleObject(menubar)
            Style.addRectangleObject(home)
            Style.addRectangleObject(learn)
            Style.addRectangleObject(start)
            Style.addRectangleObject(book)
            Style.addRectangleObject(stylebtn)
            Style.addRectangleObject(seting)

        }

    }
}
