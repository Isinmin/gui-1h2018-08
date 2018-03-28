import QtQuick 2.0

<<<<<<< HEAD
=======

// Кнопки клавиатуры (исправила расположение)
>>>>>>> 1cde2b7ff71df7e1774a6da7d2ec7e8c23c79b15
Rectangle {
    id: button
    property alias font: label.font
    property alias text: label.text
    signal triggered
    property bool pressed: mouseArea.pressed
    border.color: "black"
    border.width: 1
    radius: width / 50

    width: label.implicitWidth + topLevel.width / 50 * 2
    height: label.implicitHeight

    Text {
        id: label
        anchors.centerIn: parent
        anchors.verticalCenterOffset: pressed ? parent.height / 20 : 0
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: button.triggered()
    }
}
