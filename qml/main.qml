import QtQuick 2.0
import QtQuick.Controls 1.1

Rectangle {
    id: topLevel
    color: "black"

    height: 640
    width: 580

    function allContained(owned, word)
    {
        for (var i=0; i<word.length; ++i) {
            if (owned.indexOf(word.charAt(i)) < 0)
                return false
        }
        return true
    }

    // 2 балки голова туловище 2 руки 2 ноги
    property bool gameOver: applicationData.errorCount > 8
    property bool success: applicationData.word.length > 0 && !gameOver && allContained(applicationData.lettersOwned, applicationData.word)

    onGameOverChanged: {
        if (gameOver)
            applicationData.gameOverReveal();
    }

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

            // Отрисовка висельника
            Hangman {
                anchors.centerIn: parent
                width: Math.min(parent.width, parent.height) * 0.75
                height: width
            }
        }


        // Отображаемое слово
        Word {
            id: word
            text: applicationData.word
            anchors.bottom: letterSelector.top
            anchors.bottomMargin: parent.height * 0.05
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.8
            height: parent.height * 0.1
        }

        // Выбор буквы
        LetterSelector {
            id: letterSelector
            locked: gameOver || success
            anchors.margins: 8
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: parent.height * 0.25
            onLetterSelected: {
                applicationData.requestLetter(letter.charAt(0));
            }
            onResetPressed: {
                letterSelector.reset();
                applicationData.reset();
            }
            onRevealPressed: {
                applicationData.reveal();
            }
            onGuessWordPressed: {
                wordInputDialog.visible = true;
            }
        }
    }

    // До начала игры
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


    Connections {
        target: applicationData
        onVowelBought: {
            letterSelector.vowelPurchased(vowel);
        }
    }
}
