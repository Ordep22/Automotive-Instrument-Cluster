import QtQuick 2.15
import QtQuick.Controls 2.15



ApplicationWindow {
    visible: true
    width: 1250
    height: 900
    title: "Automotive Instrument Cluster"
    color: "gray"
    minimumWidth: 1280
    maximumWidth: 1280
    minimumHeight: 480
    maximumHeight: 480


    Image {
        anchors.top: parent.top
        source: "qrc:///AutomotiveInstrumentCluster/src/qml/Images/mainShape.png"
    }

    Column {
        anchors.centerIn: parent
        spacing: 24

        // Velocidade digital
        //Loader { source: "qrc:///AutomotiveInstrumentCluster/src/qml/components/Speedometer.qml" }

        // Combustível
        Loader { source: "qrc:///AutomotiveInstrumentCluster/src/qml/components/FuelGauge.qml" }

        // Marcha
        //Loader { source: "qrc:///AutomotiveInstrumentCluster/src/qml/components/GearIndicator.qml" }

    }
}
