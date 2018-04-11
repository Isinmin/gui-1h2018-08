import QtQuick 2.2
<<<<<<< HEAD

=======
// дефолтная кнопка
>>>>>>> 1676b795e71e29a782c14b718575a402d34b2bf9
SimpleButton {
    id: keyItem

    property bool purchasable: false

    signal keyActivated(string letter)

    onClicked: {
        if (available) {
            keyActivated(text);
        }
    }

}
