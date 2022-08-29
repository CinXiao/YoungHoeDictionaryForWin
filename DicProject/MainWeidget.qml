import QtQuick 2.0
import QtQuick.Controls 2.5
import "../BasicComponnet"
import "RootWidget"
Item {

    property int courrentindex:1

    id:root

    signal startLearn(var lessonname)

    function finishedtest()
    {
        learn.finishedtest()
    }

    function changestyletosun()
    {
        home.sun()
        dictionary.sun()
        collect.sun()
        seting.sun()
        learn.sun()
    }
    function changestyletomoon()
    {
        home.moon()
        dictionary.moon()
        collect.moon()
        seting.moon()
        learn.moon()

    }
    SwipeView
    {
        id:view
        clip: true
        interactive: false
        anchors.fill: parent
        currentIndex:courrentindex
        Page{HomeWidget{id:home}}
        Page{LearnWidget{
                id:learn
            onStartLearn:
            {
                root.startLearn(lessonname)

            }
            }}
        Page{DictionaryWidget{id:dictionary}}
        Page{CollectWidget{id:collect}}

        //登陆//个人信息
        Page{}
        //设置
        Page{SetingWidget{id:seting}}






onCurrentIndexChanged:
{

    switch(currentIndex)
    {
     case 3:
     {
        collect.load()
     }break;

    }

}



    }

}
