// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 100
    height: 62
    signal clicked
    signal held
    signal released

    property bool waitingForRelease

    MouseArea {
        id: touchButton
        anchors.fill: parent
        onPressAndHold: {
            console.log("PadButton: Pressed and Held")
            waitingForRelease = true
            pressAndHoldTimer.start()
        }
        onClicked: {
            console.log("PadButton: Clicked")
        }
        onReleased: {
            console.log("PadButton: Released");
            waitingForRelease = false
        }
    }

    Component.onCompleted: {
        touchButton.clicked.connect(clicked)
        touchButton.pressAndHold.connect(held)
        touchButton.released.connect(released)
    }

    Timer {
        id: pressAndHoldTimer
        interval: 200
        triggeredOnStart: true
        repeat: waitingForRelease
        onTriggered: {
            if(waitingForRelease) {
                console.log("PadButton: Holding")
                held()
            }
        }
    }
}
