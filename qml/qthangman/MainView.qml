
import QtQuick 2.2
import QtQuick.Controls 1.1
import org.qtproject.qthangman 1.0

Item {
    id: topLevel

<<<<<<< HEAD
    height: 480
    width: 320
=======
    height: 650
    width: 650
>>>>>>> 1676b795e71e29a782c14b718575a402d34b2bf9
    property real buttonHeight: 0
    property real globalMargin: width * 0.025

    Component.onCompleted: forceActiveFocus()
    Keys.onBackPressed: {
        if (pageStack.depth === 1) {
            Qt.quit()
        } else {
            pageStack.pop()
            event.accepted = true
            forceActiveFocus()
        }
    }
    focus: true

    HangmanGame {
        id: applicationData
        onWordChanged: {
            if (word.length > 0)
                splashLoader.source = "";
        }
    }

    StackView {
        id: pageStack
        anchors.fill: topLevel
        initialItem: Qt.resolvedUrl("GameView.qml")
    }

}
