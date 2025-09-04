// qml/components/Speedometer.qml
import QtQuick 2.15
import QtQuick.Shapes 1.15

Item {
    id: root
    width: 300; height: 300

    // API pública
    property real speed: 0
    property real maxSpeed: 220
    property color needleColor: "red"

    // Mapeia speed -> ângulo (-120° .. +120°)
    property real angle: -120 + (Math.max(0, Math.min(speed, maxSpeed)) * 240 / maxSpeed)

    // Anima toda mudança de ângulo
    Behavior on angle { NumberAnimation { duration: 400; easing.type: Easing.InOutQuad } }

    // Arco base com Shape (mais reativo que Canvas)
    Shape {
        anchors.fill: parent
        ShapePath {
            strokeWidth: 10
            strokeColor: "#555"
            fillColor: "transparent"
            capStyle: ShapePath.RoundCap
            // arco de 225° a -45° (equivale a -120..+120)
            startX: root.width/2; startY: root.height/2
            PathArc {
                x: root.width/2 - 1; y: root.height/2 - 1
                radiusX: root.width/2 - 20
                radiusY: root.height/2 - 20
                // Usa PathAngleArc no Qt 6.6+ (se disponível) para ângulos explícitos
            }
        }
    }

    // Ponteiro como imagem (já pronto para “upgrade visual”)
    Image {
        id: needle
        source: "qrc:/assets/images/needle.svg"     // por ora pode ser um PNG/retângulo
        width: 8; height: root.height/2 - 30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        transform: Rotation {
            origin.x: needle.width/2
            origin.y: needle.height
            angle: root.angle
        }
        // fallback simples se a imagem não existir ainda:
        visible: status === Image.Ready
    }

    // fallback de ponteiro “rústico” (some quando a imagem carregar)
    Rectangle {
        visible: needle.status !== Image.Ready
        width: 4; height: root.height/2 - 30
        color: root.needleColor; radius: 2
        anchors.centerIn: parent
        transform: Rotation {
            origin.x: width/2
            origin.y: height
            angle: root.angle
        }
    }

    // Texto central (opcional)
    Text {
        anchors.centerIn: parent
        text: Math.round(speed) + " km/h"
        font.pixelSize: 24
        color: "#ddd"
    }
}
