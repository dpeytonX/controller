// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

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

    PadButton {
        id: leftButton
    }
    PadButton {
        id: downButton
        anchors.top: leftButton.bottom
        anchors.left: leftButton.right
    }
    PadButton {
        id: upButton
        anchors.bottom: leftButton.top
        anchors.left: leftButton.right
    }
    PadButton {
        id: rightButton
        anchors.left: upButton.right
        anchors.top: upButton.bottom
    }

    width:leftButton.width + Math.max(upButton.width, downButton.width) + rightButton.width
    height: upButton.height + Math.max(leftButton.height, rightButton.height) + downButton.height

    onLeftPressed: {
        console.log("ControlPad: left pressed")
    }
    onRightPressed: {
        console.log("ControlPad: right pressed")
    }
    onDownPressed: {
        console.log("ControlPad: down pressed")
    }
    onUpPressed: {
        console.log("ControlPad: up pressed")
    }

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
