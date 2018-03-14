import QtQuick 2.2

Item {
    id: keyView
    property real keyWidth: (width*0.83 - (horizontalSpacing * 9)) / 10
    property real keyHeight: (height - (verticalSpacing * 3)) / 4
    property real horizontalSpacing: 2
    property real verticalSpacing: 4
    property bool locked: false


    property var keys: [key1, key2, key3, key4, key5, key6, keyA, keyB, keyC, keyD,keyE,
                    keyF, keyG, keyH, keyI, keyJ,keyH, keyJ, keyK, keyL, keyM,keyN,
                    keyO, keyP, keyQ, keyR, keyS,keyT, keyU, keyV, keyW, keyX, keyY, keyZ, keyGuess, keyReveal];

    // Обновление клавиатуры (!bag!)     		
    function reset() {
        for(var i = 0; i < keys.length; ++i)
            keys[i].available = true;
    }


    /*
    function vowelPurchased(vowel) {
        if (vowel === 65) {
            keyA.available = false;
        } else if (vowel === 69) {
            keyE.available = false;
        } else if (vowel === 73) {
            keyI.available = false;
        } else if (vowel === 79) {
            keyO.available = false;
        } else if (vowel === 85) {
            keyU.available = false;
        }
    }
    */


    // Блокировка выбранных клавиш
    onLockedChanged: {
        if (locked) {
            for(var i = 0; i < keys.length; ++i)
                keys[i].available = false;
        }
    }



    signal letterSelected(string letter)
    signal guessWordPressed()
    signal resetPressed()
    signal revealPressed()
    property alias keyView: keyView

    // TODO: Поменять размер и дизайн кнопок


    // Клавиатура
    Column {
        id: column
        width: 640
        height: 480
        spacing: keyView.verticalSpacing
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
                onKeyActivated: {
                    letterSelected(letter);

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
                purchasable: false
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
                purchasable: true
                onKeyActivated: {
                    letterSelected(letter);
                }
            }
            Key {
                id: keyI
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Ш";
                available: true
                purchasable: true
                onKeyActivated: {
                    letterSelected(letter);
                }
            }
            Key {
                id: keyO
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Щ";
                available: true
                purchasable: true
                onKeyActivated: {
                    letterSelected(letter);
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
            y: 120
            anchors.left: parent.left
            anchors.leftMargin: 28
            anchors.right: parent.right
            anchors.rightMargin: 28
            spacing: keyView.horizontalSpacing
            Key {
                id: keyA
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Ф";
                available: true
                purchasable: true
                onKeyActivated: {
                    letterSelected(letter);
                }
            }
            Key {
                id: keyS
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Ы";
                available: true
                purchasable: false
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
                purchasable: false
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
                purchasable: true
                onKeyActivated: {
                    letterSelected(letter);
                }
            }
            Key {
                id: key4
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Э";
                available: true
                purchasable: true
                onKeyActivated: {
                    letterSelected(letter);
                }
            }
        }
        Row {
            y: 240
            anchors.right: parent.right
            anchors.rightMargin: 81
            anchors.left: parent.left
            anchors.leftMargin: 81
            spacing: keyView.horizontalSpacing
            Key {
                id: keyZ
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: "Я";
                available: true
                purchasable: false
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
                purchasable: false
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
                purchasable: false
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
        }
        Row {
            y: 360
            anchors.right: parent.right
            anchors.rightMargin: 138
            anchors.left: parent.left
            anchors.leftMargin: 138
            spacing: keyView.horizontalSpacing

            Key {
               id: keyReset
               height: keyView.keyHeight
               width: keyView.keyWidth * 2
               text: "Заново"
               available: true
               onKeyActivated: {
                    resetPressed();
               }

            /* "Отгадать слово"
             "Показать слово" */
            }
        }
    }
}
