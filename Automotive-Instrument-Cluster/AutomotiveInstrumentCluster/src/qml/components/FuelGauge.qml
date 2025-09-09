import QtQuick

Item {
    //Valores que virão do processamento da interface
    property real fuelmeterNeedleRotation: 10

    property double fuelLevel: 0 // 0.0 a 1.0

    property real maxValueAngle: 170
    property real minValueAngle: 10
    property real minimumValue: 100
    property real fuelDegreesPerValue: Math.abs((maxValueAngle - minValueAngle)/ minimumValue)

    anchors.right: parent.rigth
    anchors.top: parent.top
    width: 105
    height: 7
    rotation: fuelmeterNeedleRotation - 80

    // Agulha
    Image {
        anchors.left: parent.left
        anchors.verticalCenterOffset: 0
        anchors.leftMargin: -14
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:///AutomotiveInstrumentCluster/src/qml/Images/needle.png"
    }

    Behavior on fuelDegreesPerValue {
        NumberAnimation { duration: 500 }
    }

}


