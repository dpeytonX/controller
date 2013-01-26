
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

//TODO: transitions
Rectangle {
    id: padButton
    /** True if the button is pressed but has not been released **/
    property bool waitingForRelease
    /** Displays an image as the button. **/
    property Image icon
    /** Specifies the interval which the held() signal will be executed when a button is pressed and held. The default is 200ms. **/
    property int holdInterval: 200

    property real pressedOpacity: 0.5
    property real releasedOpacity: 1
    /** The duration of an transition when a button is pressed. **/
    property int easingDuration: 100

    /** Triggered when the mouse area of this button has been clicked **/
    signal clicked
    /** Triggered when the mouse area has been pressed and is being held. This will be triggered at intervals specified by the holdInteveral. **/
    signal held
    /** Triggered when a button which has been pressed and held is finally released **/
    signal released

    objectName: "PadButton"

    width: 100
    height: 60
    state: "RELEASED"

    states: [
        State {
            name: "PRESSED"
            when: touchButton.pressed
            PropertyChanges {
                target: padButton
                opacity: pressedOpacity
            }
        },
        State {
            name: "RELEASED"
            when: touchButton.released
            PropertyChanges {
                target: padButton
                opacity: releasedOpacity
            }
        }
    ]

    transitions: [
        Transition {
            from: "PRESSED"
            to: "RELEASED"
            NumberAnimation{ property: "opacity"; easing: Easing.OutQuad; duration: easingDuration}
        },
        Transition {
            from: "RELEASED"
            to: "PRESSED"
            NumberAnimation { property: "opacity"; easing: Easing.InQuad; duration: easingDuration}
        }
    ]

    onIconChanged: {
        icon.anchors.fill = padButton
    }

    MouseArea {
        id: touchButton
        anchors.fill: parent
        onPressAndHold: {
            pressAndHoldTimer.start()
        }

        onReleased: {
            waitingForRelease = false
        }

        onPressed: {
            waitingForRelease = true
            clicked(mouse)
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
