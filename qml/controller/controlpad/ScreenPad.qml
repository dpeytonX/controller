
/*

NOTE: This is licensed under BSD

Copyright (c) <2013>, <prplmnky (Dametrious Peyton)>
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the <organization> nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*/

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
