import QtQuick 1.1
import com.nokia.meego 1.0
import "controlpad"
import "resources/spritefunctions.js" as SpriteFunctions

Page {
    id: mainPage
    tools: commonTools
    objectName: "mainPage"

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

        TraditionalPad {
            id: controller
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            leftColor: "blue"
            rightColor: "blue"
            downColor: "blue"
            upColor: "blue"

            onLeftPressed: SpriteFunctions.moveSpriteLeft(sprite)
            onLeftHeld: SpriteFunctions.moveSpriteLeft(sprite)
            onRightPressed: SpriteFunctions.moveSpriteRight(sprite)
            onRightHeld: SpriteFunctions.moveSpriteRight(sprite)
            onDownPressed: SpriteFunctions.moveSpriteDown(sprite)
            onDownHeld: SpriteFunctions.moveSpriteDown(sprite)
            onUpPressed: SpriteFunctions.moveSpriteUp(sprite)
            onUpHeld: SpriteFunctions.moveSpriteUp(sprite)
        }
    }
}
