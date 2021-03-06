import QtQuick 2.2
import QtQuick.Controls 1.1

ApplicationWindow {
    id: mainWindow

    height: 650
    width: 650

    visible: true;

    Rectangle {
        id: mainRect
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "#6c5fcc"
            }
            GradientStop {
                position: 0.4
                color: "#43379e"
            }
            GradientStop {
                position: 1.0
                color: "#170f4f"
            }
        }
        anchors.fill: parent

        Loader {
            id: gameLoader
            asynchronous: true
            visible: status == Loader.Ready
            anchors.fill: parent
        }

        Loader {
            id: splashLoader
            anchors.fill: parent
            source: "SplashScreen.qml"
            onLoaded: gameLoader.source = "MainView.qml";
        }
    }
}
