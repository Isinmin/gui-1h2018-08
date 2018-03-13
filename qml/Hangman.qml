import QtQuick 2.0

Rectangle {
    id: hangman
    color: "black"
    border.color: "white"
    border.width: width / 100

    property int errorCount: applicationData.errorCount

    Text {
        text: "Вы проиграли"
        anchors.centerIn: parent
        opacity: topLevel.gameOver ? 1.0 : 0.0
        visible: opacity > 0.0
        color: "red"
        font.pixelSize: parent.width / 10
        font.bold: true
        style: Text.Outline
        styleColor: "white"
        scale: visible ? 1.0 : 30.0
        Behavior on opacity {
            NumberAnimation {
                duration: 500
            }
        }
        Behavior on scale {
            NumberAnimation {
                duration: 2000
            }
        }
    }

    Text {
        text: "Победа"
        anchors.centerIn: parent
        opacity: topLevel.success ? 1.0 : 0.0
        visible: opacity > 0.0
        color: "green"
        style: Text.Outline
        styleColor: "white"
        font.pixelSize: parent.width / 10
        scale: visible ? 1.0 : 30.0
        Behavior on opacity {
            NumberAnimation {
                duration: 500
            }
        }
        Behavior on scale {
            NumberAnimation {
                duration: 2000
            }
        }
    }
}
