import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonTools

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

        ControlPad {
            id: controller
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onLeftPressed: {
                console.log("Moving sprite left")
                sprite.x -= 10
            }

            onRightPressed: {
                console.log("Moving sprite right")
                sprite.x += 10
            }

            onDownPressed: {
                console.log("Moving sprite down")
                sprite.y += 10
            }

            onUpPressed: {
                console.log("Moving sprite up")
                sprite.y -= 10
            }
        }
    }
}
