// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
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

    property color leftColor
    property color rightColor
    property color downColor
    property color upColor

    PadButton {
        id: leftButton
        width: leftButtonWidth ? leftButtonWidth : (dPadButtonWidth ? dPadButtonWidth : width)
        height: leftButtonHeight ? leftButtonHeight : (dPadButtonHeight ? dPadButtonHeight : height)
        icon: iconLeft
        color: leftColor
    }
    PadButton {
        id: downButton
        width: !!downButtonWidth ? downButtonWidth : (dPadButtonWidth ? dPadButtonWidth : width)
        height: !!downButtonHeight ? downButtonHeight : (dPadButtonHeight ? dPadButtonHeight : height)
        icon: iconDown
        color: downColor

        anchors.top: leftButton.bottom
        anchors.left: leftButton.right
    }
    PadButton {
        id: upButton
        width: !!upButtonWidth ? upButtonWidth : (dPadButtonWidth ? dPadButtonWidth : width)
        height: !!upButtonHeight ? upButtonHeight : (dPadButtonHeight ? dPadButtonHeight : height)
        icon: iconUp
        color: upColor

        anchors.bottom: leftButton.top
        anchors.left: leftButton.right
    }
    PadButton {
        id: rightButton
        width: !!rightButtonWidth ? rightButtonWidth : (dPadButtonWidth ? dPadButtonWidth : width)
        height: !!rightButtonHeight ? rightButtonHeight : (dPadButtonHeight ? dPadButtonHeight : height)
        icon: iconRight
        color: rightColor

        anchors.left: upButton.right
        anchors.top: upButton.bottom
    }

    width:leftButton.width + Math.max(upButton.width, downButton.width) + rightButton.width
    height: upButton.height + Math.max(leftButton.height, rightButton.height) + downButton.height

    Component.onCompleted: {
        leftButton.clicked.connect(leftPressed)
        rightButton.clicked.connect(rightPressed)
        upButton.clicked.connect(upPressed)
        downButton.clicked.connect(downPressed)
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
