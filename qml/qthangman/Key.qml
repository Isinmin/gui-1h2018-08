import QtQuick 2.2
import QtMultimedia 5.8
// дефолтная кнопка

SimpleButton {
    id: keyItem

    SoundEffect{
        id:click
        source: "/click.wav"
    }
    property bool purchasable: false

    signal keyActivated(string letter)

    onClicked: {
        if (available) {
            click.play();
            keyActivated(text);
        }
    }

}
