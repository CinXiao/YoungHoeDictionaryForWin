import QtQuick 2.0
import QtGraphicalEffects 1.15
import "../../BasicComponnet"
import Collect 1.0
import"../javascript/CollectData.js" as DATA
import"../javascript/style.js" as Style
Rectangle {

    property alias word: word_text.text
    property alias phonetic: word_phonetic.text
    property alias trans: word_trans.text
    property alias audio_rectangle:audiu_model
    property  alias collect_btn: collectbtn
    border.color: "#cccccc"
    anchors.fill: parent
    radius: 5

    id:root

    function sun()
    {
        word_rect.color=Style.getsunstylerect()
        root.color=Style.getsunstylerect()

        t1.color=Style.getsunstyletext()
        t2.color=Style.getsunstyletext()
        word_phonetic.color=Style.getsunstyletext()
        word_text.color=Style.getsunstyletext()
        word_trans.color=Style.getsunstyletext()
    }


    function moon()
    {
        word_rect.color=Style.getmoonstylerect()
        root.color=Style.getmoonstylerect()

        t1.color=Style.getmoonstyletext()
        t2.color=Style.getmoonstyletext()
        word_phonetic.color=Style.getmoonstyletext()
           word_text.color=Style.getmoonstyletext()
        word_trans.color=Style.getmoonstyletext()
    }

    CollectCore {
        id: collecter
    }

    Rectangle {
        clip: true
        height: parent.height - 35
        width: parent.width - 35
        id: word_rect
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 20
            leftMargin: 10
        }

        radius: 5

        Column {

            spacing: 30
            Row {

                CollectBtn {
                    id: collectbtn
                    iscollect: false
                    onClicked: {
                        //没有收藏
                        if (!collecter.iscollected(word_text.text)) {
                            collecter.collect(word, trans, phonetic, 0)

                        } else { //取消收藏
                            collecter.remove(word);

                        }
                        iscollect = !iscollect
                    }
                }
                anchors.left: parent.left
                anchors.leftMargin: 10
                width: parent.width
                height: 35
                spacing: 5
                Text {
                    color: "#696969"
                    id: word_text
                    font.pixelSize: 30
                    font.bold: true
                    font.family: "微软雅黑"
                    text: ""
                    onTextChanged: {
                        collectbtn.iscollect = collecter.iscollected(
                                    word_text.text)
                    }
                }
                Text {
                    color: "#696969"
                    id: word_phonetic
                    font.pixelSize: 20
                    font.bold: true
                    font.family: "微软雅黑"
                }
            }

            Row {
                id:audiu_model
                anchors.left: parent.left
                anchors.leftMargin: 10
                spacing: 20

                Row {
                    spacing: 2
                    Text {
                        id:t1
                        font.family: "微软雅黑"
                        text: "【美】"
                    }
                    PlayBtn {
                        anchors.verticalCenter: t1.verticalCenter
                        audio: word_text.text
                        type:2
                    }
                }
                Row {

                    spacing: 2
                    Text {
                        id:t2
                        font.family: "微软雅黑"
                        text: "【英】"
                    }
                    PlayBtn {
                        anchors.verticalCenter: t2.verticalCenter
                        audio: word_text.text
                        type:3
                    }
                }

            }

            Text {
                id: word_trans
                anchors.left: parent.left
                anchors.leftMargin: 20
                color: "#696969"
                font.pixelSize: 15
                font.bold: true
                font.family: "微软雅黑"
                text: ""
            }
        }
    }
}
