import QtQuick 2.2
import QtQuick.Controls 1.1

Item {
    id: dialog
    PageHeader {
        id: header

        title: language==="ru" ? "Что это за слово?" : "Whats the word?"
        onClicked: {
            Qt.inputMethod.hide();
        }
    }


    Word {
        id: word
        text: applicationData.word
        anchors.top: header.bottom
        anchors.bottomMargin: parent.height * 0.05
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.8
        height: parent.height * 0.1
    }

    function guess() {
        applicationData.guessWord(input.text)
        input.text = ""
        Qt.inputMethod.hide();
        pageStack.pop();
        topLevel.forceActiveFocus()
    }

    TextField {
        id: input
        font.capitalization: Font.AllUppercase
        inputMethodHints: Qt.ImhLatinOnly | Qt.ImhUppercaseOnly | Qt.ImhNoPredictiveText
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        focus: true
        maximumLength: applicationData.word.length
        anchors.top: word.bottom
        anchors.right: word.right
        anchors.left: word.left
        height: word.height
        anchors.topMargin: topLevel.globalMargin * 2
        font.pixelSize: height * 0.75
        onAccepted: {
            dialog.guess();
        }
    }

    Component.onCompleted: {
        Qt.inputMethod.show();
        input.forceActiveFocus();
    }
}
