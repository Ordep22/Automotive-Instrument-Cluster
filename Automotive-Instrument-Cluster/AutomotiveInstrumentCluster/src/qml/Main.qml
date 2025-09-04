import QtQuick 2.15
import QtQuick.Controls 2.15



ApplicationWindow {
    visible: true
    width: 800
    height: 480
    title: "Instrument Cluster (MVP)"
    color: "white"

    Column {
        anchors.centerIn: parent
        spacing: 24

        // Velocidade digital
        Loader { source: "qrc:///AutomotiveInstrumentCluster/src/qml/components/Speedometer.qml" }

        // Combustível
        Loader { source: "qrc:///AutomotiveInstrumentCluster/src/qml/components/FuelGauge.qml" }

        // Marcha
        Loader { source: "qrc:///AutomotiveInstrumentCluster/src/qml/components/GearIndicator.qml" }

    }
}
