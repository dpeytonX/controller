import QtQuick 1.1

/**
  * ScreenPad.qml
  * Represents a screen directional pad which has buttons
  * on the four sides of the screen.
  */
AbstractDirectionalPad {
    id: dirPad
    objectName: "ScreenPad"

    buttonPressedOpacity: .8
    buttonReleasedOpacity: 0.01
    buttonOpacityDuration: 200

    property int buttonHoldInterval

    PadButton {
        id: leftButton
        width: leftButtonWidth ? leftButtonWidth : (dPadButtonWidth ? dPadButtonWidth : width)
        height: 0
        icon: iconLeft
        color: leftColor
        visible: leftButtonVisible
        holdInterval: buttonHoldInterval

        anchors.top: dirPad.top
        anchors.bottom: dirPad.bottom
        anchors.left: dirPad.left

        onClicked: {
            if(waitingForRelease) {
                leftPressed()
            }
        }

        opacity: buttonReleasedOpacity
        pressedOpacity: buttonPressedOpacity
        releasedOpacity: buttonReleasedOpacity
        easingDuration: buttonOpacityDuration
    }
    PadButton {
        id: downButton
        width: 0
        height: downButtonHeight ? downButtonHeight : (dPadButtonHeight ? dPadButtonHeight : height)
        icon: iconDown
        color: downColor
        visible: downButtonVisible
        holdInterval: buttonHoldInterval

        anchors.left: leftButton.right
        anchors.right: rightButton.left
        anchors.bottom: dirPad.bottom

        onClicked: {
            if(waitingForRelease) {
                downPressed()
            }
        }

        opacity: buttonReleasedOpacity
        pressedOpacity: buttonPressedOpacity
        releasedOpacity: buttonReleasedOpacity
        easingDuration: buttonOpacityDuration
    }
    PadButton {
        id: upButton
        width: 0
        height: upButtonHeight ? upButtonHeight : (dPadButtonHeight ? dPadButtonHeight : height)
        icon: iconUp
        color: upColor
        visible: upButtonVisible
        holdInterval: buttonHoldInterval

        anchors.left: leftButton.right
        anchors.right: rightButton.left
        anchors.top: dirPad.top

        onClicked: {
            if(waitingForRelease) {
                upPressed()
            }
        }

        opacity: buttonReleasedOpacity
        pressedOpacity: buttonPressedOpacity
        releasedOpacity: buttonReleasedOpacity
        easingDuration: buttonOpacityDuration
    }
    PadButton {
        id: rightButton
        height: 0
        width: rightButtonWidth ? rightButtonWidth : (dPadButtonWidth ? dPadButtonWidth : width)
        icon: iconRight
        color: rightColor
        visible: rightButtonVisible
        holdInterval: buttonHoldInterval

        anchors.top: dirPad.top
        anchors.bottom: dirPad.bottom
        anchors.right: dirPad.right

        onClicked: {
            if(waitingForRelease) {
                rightPressed()
            }
        }

        opacity: buttonReleasedOpacity
        pressedOpacity: buttonPressedOpacity
        releasedOpacity: buttonReleasedOpacity
        easingDuration: buttonOpacityDuration
    }
}
