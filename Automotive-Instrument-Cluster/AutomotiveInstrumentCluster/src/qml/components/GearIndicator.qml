import QtQuick 2.15

Rectangle {
    width: 140
    height: 60
    radius: 12
    border.width: 2
    border.color: "white"
    color: "transparent"

    Text {
        anchors.centerIn: parent
        text: "Gear: " + clusterBackend.gear
        color: "white"
        font.pixelSize: 28
        font.bold: true
    }
}
