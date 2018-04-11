import QtQuick 2.2
<<<<<<< HEAD

=======
 // контейнер для кнопки назад
>>>>>>> 1676b795e71e29a782c14b718575a402d34b2bf9
Item {
    id: header

    property alias title: titleText.text
    property int buttonHeight: topLevel.buttonHeight
    signal clicked()


    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: buttonHeight + (topLevel.globalMargin * 2)
    SimpleButton {
        id: backButton
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: topLevel.globalMargin
        height: buttonHeight
        width: parent.width * 0.25
        text: "Назад"
        onClicked: {
            pageStack.pop();
            header.clicked();
        }
    }
    Text {
        id: titleText
        anchors.left: backButton.right
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: topLevel.globalMargin
        font.family: Settings.helpFontFamily
        color: "white"
        font.pointSize: 64
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        minimumPointSize: 8
    }
}
