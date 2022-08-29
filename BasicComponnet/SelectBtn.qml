import QtQuick 2.9

   Rectangle
{
    id:root


    property alias text: m_text.text
    signal clicked()

border.color: "#cccccc"
    radius:5
    width: 250
    height:80




        Text {
            anchors.centerIn: parent
            id:m_text
            font.family: "微软雅黑"
            font.pixelSize: 25
            text:"Select"
            color:"#2b2b2b"
            Behavior on color
            {
                ColorAnimation {
                    duration: 200
                }

            }
        }



        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            onClicked:
            {

              root.clicked()
            }
            onPressed:
            {

            }
            onExited:
            {
                 m_text.color="#2b2b2b"
                root.border.color= "#cccccc"
            }
            onEntered:
            {

                 m_text.color="#297BCC"
                 root.border.color= "#297BCC"
            }


        }
        Behavior on border.color
        {

            ColorAnimation {
                duration: 200
            }

        }







}


