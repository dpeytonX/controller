
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
