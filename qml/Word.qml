import QtQuick 2.1
import QtQuick.Controls 1.0

<<<<<<< HEAD
=======
// Отрисовка слова
>>>>>>> 1cde2b7ff71df7e1774a6da7d2ec7e8c23c79b15
Item {
    id: word
    property string text: ""

    Row {
        id: row
        spacing: topLevel.width / 100
        anchors.fill: parent
        Repeater {
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
