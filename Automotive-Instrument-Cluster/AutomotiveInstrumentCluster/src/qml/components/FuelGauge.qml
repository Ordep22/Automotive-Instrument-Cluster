import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 400
    height: 80

    Column {
        anchors.centerIn: parent
        spacing: 8

        Text {
            text: "Fuel: " + clusterBackend.fuel + "%"
            color: "white"
            font.pixelSize: 20
        }

        ProgressBar {
            width: 360
            from: 0
            to: 100
            value: clusterBackend.fuel
        }
    }
}
