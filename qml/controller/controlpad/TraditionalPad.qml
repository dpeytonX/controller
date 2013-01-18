import QtQuick 1.1

/**
  * TraditionalPad.qml
  * Represents a traditional directional pad which has buttons
  * located in four corners joined together.
  */
AbstractDirectionalPad {
    id: dirPad
    objectName: "TraditionalPad"

    PadButton {
        id: leftButton
        width: leftButtonWidth ? leftButtonWidth : (dPadButtonWidth ? dPadButtonWidth : width)
        height: leftButtonHeight ? leftButtonHeight : (dPadButtonHeight ? dPadButtonHeight : height)
        icon: iconLeft
        color: leftColor
        visible: leftButtonVisible

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
        visible: downButtonVisible

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
        visible: upButtonVisible

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
        visible: rightButtonVisible

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
        iconDirPad.anchors.fill = dirPad
    }
}
