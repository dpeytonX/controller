// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    signal leftPressed
    signal downPressed
    signal upPressed
    signal rightPressed

    PadButton {
        id: left
    }
    PadButton {
        id: down
        anchors.top: left.bottom
        anchors.left: left.right
    }
    PadButton {
        id: up
        anchors.bottom: left.top
        anchors.left: left.right
    }
    PadButton {
        id: right
        anchors.left: up.right
        anchors.top: up.bottom
    }

    width:left.width + Math.max(up.width, down.width) + right.width
    height: up.height + Math.max(left.height, right.height) + down.height

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
        left.pressed.connect(leftPressed)
        right.pressed.connect(rightPressed)
        up.pressed.connect(upPressed)
        down.pressed.connect(downPressed)
    }


}
