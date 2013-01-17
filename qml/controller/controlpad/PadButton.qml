import QtQuick 1.1

//TODO: icon property
//TODO: transitions
Rectangle {
    id: padButton
    /** True if the button is pressed but has not been released **/
    property bool waitingForRelease
    /** Displays an image as the button. **/
    property Image icon
    /** Specifies the interval which the held() signal will be executed when a button is pressed and held. The default is 200ms. **/
    property int holdInterval: 200

    /** Triggered when the mouse area of this button has been clicked **/
    signal clicked
    /** Triggered when the mouse area has been pressed and is being held. This will be triggered at intervals specified by the holdInteveral. **/
    signal held
    /** Triggered when a button which has been pressed and held is finally released **/
    signal released

    objectName: "PadButton"

    width: 100
    height: 60

    onIconChanged: {
        if(!!icon) {
            icon.anchors.fill = padButton
        }
    }

    MouseArea {
        id: touchButton
        anchors.fill: parent
        onPressAndHold: {
            waitingForRelease = true
            pressAndHoldTimer.start()
        }

        onReleased: {
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
        interval: holdInterval
        triggeredOnStart: true
        repeat: waitingForRelease
        onTriggered: {
            if(waitingForRelease) {
                held()
            }
        }
    }
}
