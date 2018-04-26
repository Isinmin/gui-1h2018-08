
import QtQuick 2.2
// клавиатура
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

    property var russianVowels: ["У","Е","Ы","А","О","Э","Я","И","Ю"];

    property var russianConsonants:["Й","Ц","К","Н","Г","Ш","Щ","З","Х","Ъ",
                                    "Ф","В","П","Р","Л","Д","Ж",
                                    "Ч","С","М","Т","Ь","Б"];
    property var russianAlphabet: ["Й","Ц","У","К","Е","Н","Г","Ш","Щ","З","Х","Ъ",
    "Ф","Ы","В","А","П","Р","О","Л","Д","Ж","Э",
    "Я","Ч","С","М","И","Т","Ь","Б","Ю"];

    property var englishAlphabet: ['Q','W','E','R','T','Y','U','I','O','P', , ,
        'A','S','D','F','G','H','J','K','L', , ,
        'Z','X','C','V','B','N','M'];

    property var englishVowels: ['E','Y','U','I','O','A'];

     // отобразить клавиатуру заново
    function reset() {

        for (var i = 0; i < keys.length; ++i)
            keys[i].available = true;
    }


    function checkPurchasable(i){
        if(language==="ru"){
            for(var q = 0; q < russianVowels.length; q++){
                if(russianAlphabet[i]===russianVowels[q])
                    return true;
            }
            return false;
        }
        if(language === "en"){
            for(var q= 0; q < englishVowels.length; q++){
                if(englishAlphabet[i]===englishVowels[q])
                    return true;
            }
            return false;
        }
 }

    function checkEnabability(i){
        if(language==="ru")
            for(var q = 0; q<9; q++)
            {
                if(russianAlphabet[i]===russianVowels[q])
                    return false;
            }
        return true;
    }

    function checkVisibility(i){
        if(language==="en"){
            var russianSymbolsIndexes = [10,11,21,22,30,31];
            for(var q = 0; q < 6; q++){
                if(i===russianSymbolsIndexes[q])
                    return false;

            }
            return true;
        }
        else
            return true;
    }

    function checkOpacity(i){
        if(language==="ru")
            for(var q = 0; q<9; q++)
            {
                if(russianAlphabet[i]===russianVowels[q])
                    return 0.0;
            }
        return 1.0;
    }


    function getVisability(){

        if(language!=="ru")
            return false;
    }

    function getKey(i){
        if(language==="ru")
            return russianAlphabet[i];
        if(language==="en")
            return englishAlphabet[i];
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
                text: getKey(0)
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
                text: getKey(1)
                available: true
                purchasable: false
                enabled: checkEnabability(1)
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyE
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: getKey(2)
                available: true
                purchasable: true
//                enabled: !hideVowels
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
                text: getKey(3)
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
                text: getKey(4)
                available: true
                purchasable: checkPurchasable(4)
//                enabled: !hideVowels
                opacity: (hideVowels && language =="ru") ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyY
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: getKey(5)
                available: true
                purchasable: checkPurchasable(5)
                opacity: (hideVowels && language =="en") ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyU
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: getKey(6)
                available: true
                purchasable: checkPurchasable(6)
                opacity: (hideVowels && language =="en") ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyI
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: getKey(7)
                available: true
                opacity: (hideVowels && language =="en") ? 0.0 : 1.0
                purchasable: checkPurchasable(7)
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyO
                height: keyView.keyHeight
                width: keyView.keyWidth
                opacity: (hideVowels && language =="en") ? 0.0 : 1.0
                text: getKey(8)
                available: true
                purchasable: checkPurchasable(8)
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyP
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: getKey(9)
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
                text: getKey(10)
                visible: checkVisibility(10)
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
                text: getKey(11)
                available: true
                visible: checkVisibility(11)
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
                text: getKey(12)
                available: true
                purchasable: checkPurchasable(12)
//                enabled: !hideVowels
                opacity: (hideVowels && language =="en") ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyS
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: getKey(13)
                available: true
                purchasable: checkPurchasable(13)
//                enabled: !hideVowels
                opacity: (hideVowels && language =="ru") ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyD
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: getKey(14)
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
                text: getKey(15)
                available: true
                purchasable: checkPurchasable(15)
//                enabled: !hideVowels
                opacity: (hideVowels && language =="ru") ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyG
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: getKey(16)
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
                text: getKey(17)
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
                text: getKey(18)
                available: true
                purchasable: checkPurchasable(18)
//                enabled: !hideVowels
                opacity: (hideVowels && language =="ru") ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyK
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: getKey(19)
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
                text: getKey(20)
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
                text: getKey(21)
                visible: checkVisibility(21)
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
                text: getKey(22)
                visible: checkVisibility(22)
                available: true
                purchasable: checkPurchasable()
//                enabled: !hideVowels
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
                text: getKey(23)
                available: true
                purchasable: checkPurchasable(23)
//                enabled: !hideVowels
                opacity: (hideVowels && language =="ru") ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyX
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: getKey(24)
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
                text: getKey(25)
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
                text: getKey(26)
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
                text: getKey(27)
                available: true
                purchasable: checkPurchasable(27)
//                enabled: !hideVowels
                opacity: (hideVowels && language =="ru") ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
            Key {
                id: keyN
                height: keyView.keyHeight
                width: keyView.keyWidth
                text: getKey(28)
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
                text: getKey(29)
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
                text: getKey(30)
                visible: checkVisibility(30)
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
                text: getKey(31)
                visible: checkVisibility(31)
                available: true
                purchasable: true
//                enabled: !hideVowels
                opacity: hideVowels ? 0.0 : 1.0
                onKeyActivated: {
                    letterSelected(letter);
                    available = false;
                }
            }
        }
    }
}
