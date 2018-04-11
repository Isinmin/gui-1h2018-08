

import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

Item {
    PageHeader {
        id: header
        title: "Hangman Store"
    }

    Column {
        anchors.top: header.bottom
        anchors.bottom: restoreButton.top
        anchors.margins: topLevel.globalMargin
        anchors.right: parent.right
        anchors.left: parent.left
        spacing: topLevel.globalMargin
        // ![2]
        StoreItem {
            product: product100Vowels
            width: parent.width
        }

        StoreItem {
            product: productUnlockVowels
            width: parent.width
        }
        // ![2]
    }

    SimpleButton {
        id: restoreButton
        anchors.bottom: parent.bottom
        anchors.margins: topLevel.globalMargin
        anchors.horizontalCenter: parent.horizontalCenter
        height: topLevel.buttonHeight
        width: parent.width * .5
        text: "Restore Purchases"
        onClicked: {
            iapStore.restorePurchases();
        }
    }
}
