import QtQuick 2.0

Rectangle {
    property string  textcolor:""
anchors.fill: parent

Text {
    id: name
    text: "正在开发"
    color:textcolor
}


}
