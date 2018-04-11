import QtQuick 2.2
import QtQuick.Controls 1.1


Rectangle {
    id: borderRect
    color: "transparent"
    border.color: "white"
    width: scoreText.contentWidth + (topLevel.globalMargin * 2)
    radius: 10
    Label {
        id: scoreText
        anchors.fill: parent
        anchors.topMargin: topLevel.globalMargin
        anchors.bottomMargin: topLevel.globalMargin
        anchors.rightMargin: topLevel.globalMargin
        anchors.leftMargin: topLevel.globalMargin
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: parent.height
        font.family: Settings.fontFamily
        font.weight: Font.Light
        text: applicationData.score
        color: "white"
    }
}
