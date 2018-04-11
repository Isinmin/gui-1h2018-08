
import QtQuick 2.2

Item {
    id: keyView
    property real keyWidth: (width - (horizontalSpacing * 9)) / 12
    property real keyHeight: (height - (verticalSpacing * 2)) / 4
    property real horizontalSpacing: topLevel.globalMargin / 4
    property real verticalSpacing: topLevel.globalMargin / 4
    property bool locked: false
    property bool hideVowels: false

    Component.onCompleted: topLevel.buttonHeight = keyHeight
    onKeyHeightChanged: topLevel.buttonHeight = keyHeight

    property var keys: [key1, key2, key3, key4, key5, key6, keyA, keyB, keyC, keyD, keyE, keyF, keyG, keyH, keyI, keyJ,
            keyH, keyJ, keyK, keyL, keyM, keyN, keyO, keyP, keyQ, keyR, keyS,
            keyT, keyU, keyV, keyW, keyX, keyY, keyZ];

    function reset() {

        for (var i = 0; i < keys.length; ++i)
            keys[i].available = true;
    }

    onLockedChanged: {
        if (locked) {
            for (var i = 0; i < keys.length; ++i)
                keys[i].available = false;
        }
    }

    signal letterSelected(string letter) //Выбор кнопки
    signal guessWordPressed() // Отгадать слово
    signal resetPressed() // Новая игра
    signal revealPressed() // Обновление клавиатуры

    //Клавиатура
    Column {
        spacing: keyView.verticalSpacing
        anchors.fill: parent
        Row {
            spacing: keyView.horizontalSpacing
            Key {
                id: keyQ
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Й";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyW
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Ц";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyE
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "У";
                available: true
                purchasable: true
                enabled: !hideVowels
                opacity: hideVowels ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyR
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "К";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyT
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Е";
                available: true
                purchasable: true
                enabled: !hideVowels
                opacity: hideVowels ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyY
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Н";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyU
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Г";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyI
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Ш";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyO
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Щ";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyP
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "З";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: key1
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Х";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: key2
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Ъ";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: keyView.horizontalSpacing
            Key {
                id: keyA
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Ф";
                available: true
                purchasable: true
                enabled: !hideVowels
                opacity: hideVowels ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyS
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Ы";
                available: true
                purchasable: true
                enabled: !hideVowels
                opacity: hideVowels ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyD
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "В";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyF
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "А";
                available: true
                purchasable: true
                enabled: !hideVowels
                opacity: hideVowels ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyG
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "П";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyH
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Р";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyJ
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "О";
                available: true
                purchasable: false
                enabled: !hideVowels
                opacity: hideVowels ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyK
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Л";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyL
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Д";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: key3
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Ж";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: key4
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Э";
                available: true
                purchasable: true
                enabled: !hideVowels
                opacity: hideVowels ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
        }
        Row {
            spacing: keyView.horizontalSpacing
            anchors.horizontalCenter: parent.horizontalCenter
            Key {
                id: keyZ
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Я";
                available: true
                purchasable: true
                enabled: !hideVowels
                opacity: hideVowels ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyX
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Ч";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyC
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "С";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyV
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "М";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyB
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "И";
                available: true
                purchasable: true
                enabled: !hideVowels
                opacity: hideVowels ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyN
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Т";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyM
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Ь";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: key5
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Б";
                available: true
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: key6
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Ю";
                available: true
                purchasable: true
                enabled: !hideVowels
                opacity: hideVowels ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
        }
    }
}
