import QtQuick 1.1
import com.nokia.meego 1.0
import "controlpad"

Page {
    tools: commonTools
    objectName: "styleDirPad"

    Rectangle {
        id: backgroundRect
        color: "black"
        anchors.fill: parent

        Sprite {
            id: sprite
            color: "red"
            x: (parent.width - width) / 2
            y: 100
        }

        DirectionalPad {
            id: controller
            dPadButtonWidth: 90
            dPadButtonHeight: 70
            upButtonWidth: 70
            upButtonHeight: 90
            downButtonWidth: 70
            downButtonHeight: 90

            iconDown: iconDown
            iconUp: iconUp
            iconRight: iconRight
            iconLeft: iconLeft

            leftColor: "black"
            rightColor: "black"
            upColor: "black"
            downColor: "black"

            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            function moveSpriteLeft() {
                console.log("Moving sprite left")
                sprite.x -= 10
            }

            function moveSpriteRight() {
                console.log("Moving sprite right")
                sprite.x += 10
            }

            function moveSpriteDown() {
                console.log("Moving sprite down")
                sprite.y += 10
            }

            function moveSpriteUp() {
                console.log("Moving sprite up")
                sprite.y -= 10
            }

            onLeftPressed: moveSpriteLeft()
            onLeftHeld: moveSpriteLeft()
            onRightPressed: moveSpriteRight()
            onRightHeld: moveSpriteRight()
            onDownPressed: moveSpriteDown()
            onDownHeld: moveSpriteDown()
            onUpPressed: moveSpriteUp()
            onUpHeld: moveSpriteUp()

            Image {
                id: iconDown
                source: "resources/down.png"
            }
            Image {
                id: iconUp
                source: "resources/up.png"
            }
            Image {
                id: iconRight
                source: "resources/right.png"
            }
            Image {
                id: iconLeft
                source: "resources/left.png"
            }
        }
    }
}
