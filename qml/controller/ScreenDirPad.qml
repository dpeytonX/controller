import QtQuick 1.1
import com.nokia.meego 1.0
import "controlpad"
import "resources/spritefunctions.js" as SpriteFunctions

Page {
    id: mainPage
    tools: commonTools
    objectName: "screenDirPad"

    Rectangle {
        id: backgroundRect
        color: "black"
        anchors.fill: parent

        Sprite {
            id: sprite
            color: "red"
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
        }

        ScreenPad {
            id: controller
            anchors.fill: backgroundRect
            leftColor: "blue"
            rightColor: "blue"
            downColor: "blue"
            upColor: "blue"
            leftButtonWidth: 60
            rightButtonWidth: 60
            downButtonHeight: 60
            upButtonHeight: 60

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
