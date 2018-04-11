import QtQuick 2.2

Rectangle {
    id: topLevel
    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: "#6c5fcc"
        }
        GradientStop {
            position: 0.4
            color: "#43379e"
        }
        GradientStop {
            position: 1.0
            color: "#170f4f"
        }
    }

    Hangman {
        id: logo
        anchors.centerIn: parent
        height: 268
        width: 268
        errorCount: 9
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: logo.bottom
        text: "Виселица"
        color: "white"
        font.pointSize: 24
    }
}
