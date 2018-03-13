import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {
    id: topLevel
    color: "black"

    height: 640
    width: 580

    Item {
        id: gameScreen
        visible: applicationData.word.length > 0
        anchors.fill: parent

        Text {
            id: title
            color: "white"
            text: qsTr("")
            font.pixelSize: Math.min(parent.width, parent.height) / 15
            anchors.right: parent.right
            anchors.rightMargin: topLevel.width / 100
        }

        Item {
            anchors.top: title.bottom
            anchors.bottom: word.top
            anchors.left: parent.left
            anchors.right: parent.right

            Hangman {
                anchors.centerIn: parent
                width: Math.min(parent.width, parent.height) * 0.75
                height: width
            }
        }
        Word {
            id: word
            text: applicationData.word
            anchors.bottom: letterSelector.top
            anchors.bottomMargin: parent.height * 0.05
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.8
            height: parent.height * 0.1
        }
    }

    Rectangle {
    id: loadingScreen
    visible: !gameScreen.visible
    anchors.fill: parent
    color: "black"

    BusyIndicator {
        id: busyIndicator
        running: true
        anchors.centerIn: parent
    }

}
