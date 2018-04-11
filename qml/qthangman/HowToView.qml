import QtQuick 2.2
<<<<<<< HEAD

=======
// справка 
>>>>>>> 1676b795e71e29a782c14b718575a402d34b2bf9
Item {
    PageHeader {
        id: header
        title: "Как играть"
    }

    Flickable {
        id: helpFlickable
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.margins: topLevel.globalMargin
        clip: true

        contentHeight: helpContent.height + (topLevel.globalMargin * 2)

        Item {
            id: helpContent
            width: parent.width
            height: contentColumn.height
            Column {
                id: contentColumn
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.margins: topLevel.globalMargin
                spacing: topLevel.globalMargin
                Text {
                    height: contentHeight
                    width: parent.width
                    wrapMode: Text.Wrap
                    font.family: Settings.helpFontFamily
                    color: "white"
                    font.pixelSize: helpFlickable.height * 0.04
                    text: "\
Виселица -  классическая игра, в которой нужно отгадать слово \
раньше, чем человечек на виселице умрёт \n"
                }

                Word {
                    anchors.margins: topLevel.globalMargin
                    height: topLevel.buttonHeight
                    width: parent.width * .8
                    text: "Виселица"
                }

                Text {
                    height: contentHeight
                    width: parent.width
                    wrapMode: Text.Wrap
                    font.family: Settings.helpFontFamily
                    color: "white"
                    font.pixelSize: helpFlickable.height * 0.04
                    text: "\
\nВаша цель, отгадать слово. Если Вы выбираете букву, которая являются частью слова \
она будет отображаться во всех местах, в которых она находится. За каждый  \
Ваш промах, человечек окажется на шаг ближе к смерти \n"
                }

                Hangman {
                    height: width
                    width: parent.width / 2
                    errorCount: 9
                }

                Text {
                    height: contentHeight
                    width: parent.width
                    wrapMode: Text.Wrap
                    font.family: Settings.helpFontFamily
                    color: "white"
                    font.pixelSize: helpFlickable.height * 0.04
                    text: "\
\nИгра слишком простая, поэтому гласные Вам придётся заработать. \
За каждое отгаданное слово Вам дается шанс проверить одну гласную \
на принадлежность слову"
                }

                ScoreItem {
                    anchors.margins: topLevel.globalMargin
                    height: topLevel.buttonHeight
                }

                Text {
                    height: contentHeight
                    width: parent.width
                    wrapMode: Text.Wrap
                    font.family: Settings.helpFontFamily
                    color: "white"
                    font.pixelSize: helpFlickable.height * 0.04
                    text: "\
Когда Вы отгадываете слово Вы зарабатываете очки. \
Очки ничего не делают, кроме того, что показывают Вашу крутость! \
Приятной игры :)
"
                }
            }
        }
    }
}
