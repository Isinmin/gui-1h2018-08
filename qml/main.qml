import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

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

<<<<<<< HEAD
=======
    // 2 балки голова туловище 2 руки 2 ноги
>>>>>>> 1cde2b7ff71df7e1774a6da7d2ec7e8c23c79b15
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

<<<<<<< HEAD
=======

        // Отображаемое слово
>>>>>>> 1cde2b7ff71df7e1774a6da7d2ec7e8c23c79b15
        Word {
            id: word
            text: applicationData.word
            anchors.bottom: letterSelector.top
            anchors.bottomMargin: parent.height * 0.05
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.8
            height: parent.height * 0.1
        }

<<<<<<< HEAD
=======
        // Выбор буквы
>>>>>>> 1cde2b7ff71df7e1774a6da7d2ec7e8c23c79b15
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
<<<<<<< HEAD

=======
>>>>>>> 1cde2b7ff71df7e1774a6da7d2ec7e8c23c79b15
            onRevealPressed: {
                applicationData.reveal();
            }
            onGuessWordPressed: {
                wordInputDialog.visible = true;
            }
        }
    }

<<<<<<< HEAD
//    RowLayout {
//        id: rowLayout
//        anchors.top: parent.top
//        anchors.left: parent.left
//        anchors.right: parent.right
//        anchors.margins: 5

//        spacing: 10

//        Text {text: qsTr("Имя")}
//        TextField {id: fnameField}
//        Text {text: qsTr("Фамилия")}
//        TextField {id: snameField}

//        Button {
//            text: qsTr("Добавить")

//            //Вносим новую запись в базу данных
//            onClicked: {
//                database.insertIntoTable(fnameField.text , snameField.text)
//                myModel.updateModel() //Обновляем модель данных с новой записью
//            }
//        }
//    }

//    TableView {
//        id: tableView
//        anchors.top: rowLayout.bottom
//        anchors.left: parent.left
//        anchors.right: parent.right
//        anchors.bottom: parent.bottom
//        anchors.margins: 5

//        TableViewColumn {
//            role: "nickname"
//            title: "Имя игрока"
//        }
//        TableViewColumn {
//            role:"score"
//            title: "Очки"
//        }

//        model: myModel
//        //Настройкастроки в TableView для перехвата евого клика мыши
//        rowDelegate: Rectangle {
//            anchors.fill: parent
//            color: styleData.selected? 'skyblue' : (styleData.alternate ? 'whitesmoke' : 'white');
//            MouseArea {
//                anchors.fill: parent
//                acceptedButtons: Qt.RightButton | Qt.LeftButton
//                onClicked: {
//                    tabkeView.selection.clear()
//                    tableView.selection.select(styleData.row)
//                    tableView.currentRow = styleData.row
//                    tableView.focus = true

//                    switch(mouse.button) {
//                    case Qt.RightButton:
//                        contextMenu.popup() // Вызов контекстного меню
//                        break
//                    default:
//                        break
//                    }
//                }
//            }
//        }
//    }

//    Menu {
//        id: contextMenu
//        MenuItem {
//            text: qsTr("Удалить")
//            onTriggered: {
//                //Вызвать диалоговое окно (подтверждение удаления
//                dialogDelete.open()
//            }
//        }
//    }

//    //Диалог подтверждения удаления строки из базы данных
//    MessageDialog {
//        id: dialogDelete
//        title: qsTr("Удаление записи")
//        text: qsTr("Подтвердите удаление записи из журнала")
//        icon: StandardIcon.Warning
//        standardButtons: standardButtons.Ok | StandardButton.Cancel
//        //При положителльном ответе ...
//        onAccepted: {
//            //Удаляем строку по Id, который забираем из модели данных по номеру строки в представлении
//            database.removeRecord(myModel.getId(tableView.currentRow))
//            myModel.updateModel();
//        }
//    }

=======
    // До начала игры
>>>>>>> 1cde2b7ff71df7e1774a6da7d2ec7e8c23c79b15
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

<<<<<<< HEAD
    WordInputDialog {
        id: wordInputDialog
        visible: false
        anchors.fill: parent
    }
=======
>>>>>>> 1cde2b7ff71df7e1774a6da7d2ec7e8c23c79b15

    Connections {
        target: applicationData
        onVowelBought: {
            letterSelector.vowelPurchased(vowel);
        }
    }
}
