import QtQuick 2.2
import QtQuick.Controls 1.1
import QtMultimedia 5.8
Item {
    id: gameView
    property alias dialog: gameView
    property string language: "ru"

    function allContained(owned, word)
    {
        for (var i=0; i<word.length; ++i) {
            if (owned.indexOf(word.charAt(i)) < 0)
                return false
        }
        return true
    }
    SoundEffect{
        id:winSound
        source: "/Win.wav"
    }

    SoundEffect{
        id:loseSound
        source: "/Lose.wav"
    }


    // победы и поражения

    property bool gameOver: applicationData.errorCount > 8
    property bool success: applicationData.word.length > 0 && !gameOver && allContained(applicationData.lettersOwned, applicationData.word)
    property alias globalButtonHeight: letterSelector.keyHeight


    onGameOverChanged: {
        if (gameOver){
            loseSound.play()
            applicationData.gameOverReveal();
        }
    }

    onSuccessChanged: {
        if (success === true){
            winSound.play()
            applicationData.wordsGuessedCorrectly += 1;
        }
    }

    Connections {
        target: applicationData
        onWordChanged: {
            applicationData.wordsGiven += 1;
        }
    }

    SimpleButton {
        id: vowelsAvailableText
        height: globalButtonHeight
        width: parent.width * 0.25
        visible: !applicationData.vowelsUnlocked
        text: (language=="ru" ? "Глассные: " : "Vowels: ") + applicationData.vowelsAvailable
        anchors.left: parent.left
        anchors.verticalCenter: helpButton.verticalCenter
        anchors.margins: topLevel.globalMargin
    }

    SimpleButton {
        id: changeLanguageToRu
        x: 526
        width: 100
        height: 30
        text: "ru"
        anchors.rightMargin: 14
        anchors.topMargin: 102
        onClicked:{
            language = "ru"
            GameView.language = "ru"
            dialog.language = "ru"
            applicationData.changeLanguage("ru");
        }

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: topLevel.globalMargin
    }

    SimpleButton {
        id: changeLanguageToEn
        x: 526
        width: 100
        height: 30
        text: "en"

        anchors.rightMargin: 14
        anchors.topMargin: 160
        onClicked:{
            language = "en"
            GameView.language = "en"
            applicationData.changeLanguage("en");
        }

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: topLevel.globalMargin
    }

    ScoreItem {
        anchors.margins: topLevel.globalMargin
        anchors.right: helpButton.left
        anchors.verticalCenter: helpButton.verticalCenter
        height: globalButtonHeight
    }

    SimpleButton {
        id: helpButton
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: topLevel.globalMargin
        height: globalButtonHeight
        width: globalButtonHeight
        text: "?"
        onClicked: {
            pageStack.push(Qt.resolvedUrl("HowToView.qml"))
        }
    }

    Item {
        anchors.top: helpButton.bottom
        anchors.bottom: word.top
        anchors.left: parent.left
        anchors.right: parent.right

        Hangman {
            game: gameView
            anchors.centerIn: parent
            width: Math.min(parent.width, parent.height) * 0.75
            height: width
        }
    }


    // отображение слова

    Word {
        id: word
        text: applicationData.word
        anchors.bottom: letterSelector.top
        anchors.bottomMargin: parent.height * 0.05
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.8
        height: parent.height * 0.1
    }

    // клава

    LetterSelector {
        id: letterSelector
        locked: gameOver || success
        hideVowels: applicationData.vowelsAvailable < 1 && !applicationData.vowelsUnlocked
        anchors.margins: topLevel.globalMargin
        anchors.bottom: guessButton.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.23
        onLetterSelected: {
            if (applicationData.isVowel(letter) && !applicationData.vowelsUnlocked) {
                applicationData.vowelsAvailable -= 1;
            }
            applicationData.requestLetter(letter.charAt(0));
        }
    }

    SimpleButton {
        id: revealButton
        anchors.margins: topLevel.globalMargin
        visible: !(gameOver || success)
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        height: globalButtonHeight
        width : letterSelector.keyWidth * 3
        text: language=="ru" ? "Показать" : "Show"
        onClicked: {
            loseSound.play()
            applicationData.reveal();
        }
    }
    SimpleButton {
        id: guessButton
        anchors.margins: topLevel.globalMargin
        visible: !(gameOver || success)
        anchors.bottom: parent.bottom
        anchors.left: revealButton.right
        anchors.right: parent.right
        height: globalButtonHeight
        text: language=="ru" ? "Отгадать слово целиком" : "Guess the word"
        onClicked: {
            console.log(GameView.language)
            pageStack.push(Qt.resolvedUrl("GuessWordView.qml"));
        }
    }
    SimpleButton {
        id: resetButton
        anchors.margins: topLevel.globalMargin
        visible: gameOver || success
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: globalButtonHeight
        text: language=="ru" ? "Играть ещё раз?" : "Try again?"
        onClicked: {
            letterSelector.reset();
            applicationData.reset();
        }
    }


    // поражение

    Text {
        id: gameOverText
        visible: gameOver
        anchors.fill: letterSelector
        text: language =="ru" ? "Игра закончена" : "Game over"
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        minimumPointSize: 8
        font.pointSize: 64
        color: "white"
        font.family: Settings.fontFamily
        font.weight: Font.Light
    }

    // победа

    Text {
        id: successText
        visible: success
        anchors.fill: letterSelector
        text: language=="ru" ? "Правильно!" : "Correct"
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        minimumPointSize: 8
        font.pointSize: 64
        color: "white"
        font.family: Settings.fontFamily
        font.weight: Font.Light
    }
}
