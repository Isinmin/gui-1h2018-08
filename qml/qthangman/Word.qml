
import QtQuick 2.1
import QtQuick.Controls 1.0

Item {
    id: word
    property string text: ""

    Row {
        id: row
        spacing: topLevel.width / 100
        anchors.fill: parent
        Repeater {
            id: letters
            model: text.length

            Letter {
                id: letter
                text: word.text.charAt(index)
                width: (word.width / word.text.length) - row.spacing
                height: word.height
            }
        }
    }
}
