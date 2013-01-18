import QtQuick 1.1
import com.nokia.meego 1.0
import "controlpad"
import "resources/spritefunctions.js" as SpriteFunctions

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
            iconDirPad: iconDirPad

            leftColor: "black"
            rightColor: "black"
            upColor: "black"
            downColor: "black"

            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            onLeftPressed: SpriteFunctions.moveSpriteLeft(sprite)
            onLeftHeld: SpriteFunctions.moveSpriteLeft(sprite)
            onRightPressed: SpriteFunctions.moveSpriteRight(sprite)
            onRightHeld: SpriteFunctions.moveSpriteRight(sprite)
            onDownPressed: SpriteFunctions.moveSpriteDown(sprite)
            onDownHeld: SpriteFunctions.moveSpriteDown(sprite)
            onUpPressed: SpriteFunctions.moveSpriteUp(sprite)
            onUpHeld: SpriteFunctions.moveSpriteUp(sprite)

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
            Image {
                id: iconDpad
                source: "resources/dpad.png"
            }
        }
    }
}
