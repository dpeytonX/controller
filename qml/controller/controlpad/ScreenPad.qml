import QtQuick 1.1

//TODO: comments
Item {
    signal leftPressed
    signal downPressed
    signal upPressed
    signal rightPressed
    signal leftHeld
    signal downHeld
    signal upHeld
    signal rightHeld
    signal leftReleased
    signal rightReleased
    signal upReleased
    signal downReleased

    property int dPadButtonWidth
    property int dPadButtonHeight

    property int leftButtonWidth
    property int leftButtonHeight
    property int rightButtonWidth
    property int rightButtonHeight
    property int downButtonWidth
    property int downButtonHeight
    property int upButtonWidth
    property int upButtonHeight

    property Image iconLeft
    property Image iconRight
    property Image iconDown
    property Image iconUp
    property Image iconDirPad

    property color leftColor
    property color rightColor
    property color downColor
    property color upColor

    id: dirPad
    objectName: "ScreenPad"

    PadButton {
        id: leftButton
        width: leftButtonWidth ? leftButtonWidth : (dPadButtonWidth ? dPadButtonWidth : width)
        height: 0
        icon: iconLeft
        color: leftColor

        anchors.top: dirPad.top
        anchors.bottom: dirPad.bottom
        anchors.left: dirPad.left

        onClicked: {
            if(waitingForRelease) {
                leftPressed()
            }
        }
    }
    PadButton {
        id: downButton
        width: 0
        height: downButtonHeight ? downButtonHeight : (dPadButtonHeight ? dPadButtonHeight : height)
        icon: iconDown
        color: downColor

        anchors.left: leftButton.right
        anchors.right: rightButton.left
        anchors.bottom: dirPad.bottom

        onClicked: {
            if(waitingForRelease) {
                downPressed()
            }
        }
    }
    PadButton {
        id: upButton
        width: 0
        height: upButtonHeight ? upButtonHeight : (dPadButtonHeight ? dPadButtonHeight : height)
        icon: iconUp
        color: upColor

        anchors.left: leftButton.right
        anchors.right: rightButton.left
        anchors.top: dirPad.top

        onClicked: {
            if(waitingForRelease) {
                upPressed()
            }
        }
    }
    PadButton {
        id: rightButton
        height: 0
        width: rightButtonWidth ? rightButtonWidth : (dPadButtonWidth ? dPadButtonWidth : width)
        icon: iconRight
        color: rightColor

        anchors.top: dirPad.top
        anchors.bottom: dirPad.bottom
        anchors.right: dirPad.right

        onClicked: {
            if(waitingForRelease) {
                rightPressed()
            }
        }
    }

    onIconDirPadChanged: {
        console.log("ok")
        iconDirPad.anchors.fill = dirPad
    }

    Component.onCompleted: {
        leftButton.held.connect(leftHeld)
        rightButton.held.connect(rightHeld)
        upButton.held.connect(upHeld)
        downButton.held.connect(downHeld)
        leftButton.released.connect(leftReleased)
        rightButton.released.connect(rightReleased)
        upButton.released.connect(upReleased)
        downButton.released.connect(downReleased)
    }
}
