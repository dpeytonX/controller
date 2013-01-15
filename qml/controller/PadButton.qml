// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 100
    height: 62
    signal pressed

    MouseArea {
        id: touchButton
        anchors.fill: parent
        onClicked: {
            console.log("PadButton: buttonClicked")
        }
    }

    Component.onCompleted: {
        touchButton.clicked.connect(pressed)
    }
}
