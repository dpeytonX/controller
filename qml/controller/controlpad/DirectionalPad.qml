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
    objectName: "DirectionalPad"

    PadButton {
        id: leftButton
        width: leftButtonWidth ? leftButtonWidth : (dPadButtonWidth ? dPadButtonWidth : width)
        height: leftButtonHeight ? leftButtonHeight : (dPadButtonHeight ? dPadButtonHeight : height)
        icon: iconLeft
        color: leftColor

        anchors.top: upButton.bottom

        onClicked: {
            if(waitingForRelease) {
                leftPressed()
            }
        }
    }
    PadButton {
        id: downButton
        width: downButtonWidth ? downButtonWidth : (dPadButtonWidth ? dPadButtonWidth : width)
        height: downButtonHeight ? downButtonHeight : (dPadButtonHeight ? dPadButtonHeight : height)
        icon: iconDown
        color: downColor

        anchors.top: leftButton.bottom
        anchors.left: leftButton.right

        onClicked: {
            if(waitingForRelease) {
                downPressed()
            }
        }
    }
    PadButton {
        id: upButton
        width: upButtonWidth ? upButtonWidth : (dPadButtonWidth ? dPadButtonWidth : width)
        height: upButtonHeight ? upButtonHeight : (dPadButtonHeight ? dPadButtonHeight : height)
        icon: iconUp
        color: upColor

        anchors.bottom: leftButton.top
        anchors.left: leftButton.right
        anchors.top: dirPad.top

        onClicked: {
            if(waitingForRelease) {
                upPressed()
            }
        }
    }
    PadButton {
        id: rightButton
        width: rightButtonWidth ? rightButtonWidth : (dPadButtonWidth ? dPadButtonWidth : width)
        height: rightButtonHeight ? rightButtonHeight : (dPadButtonHeight ? dPadButtonHeight : height)
        icon: iconRight
        color: rightColor

        anchors.left: upButton.right
        anchors.top: upButton.bottom

        onClicked: {
            if(waitingForRelease) {
                rightPressed()
            }
        }
    }

    width:leftButton.width + Math.max(upButton.width, downButton.width) + rightButton.width
    height: upButton.height + Math.max(leftButton.height, rightButton.height) + downButton.height

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
