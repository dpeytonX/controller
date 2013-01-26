import QtQuick 1.1

/**
  * Contains properties and signals useful in creating a custom directional pad.
  * This component contains four PadButton properties:
  * leftButton,
  * rightButton,
  * downButton,
  * upButton.
  * You may implement these four buttons in order to have
  * the directional pad signals activate when a PadButton signal is triggered.
  *
  * It is up to the implementation to determine when and how these signal execute.
  */
Item {
    signal leftPressed
    signal downPressed
    signal upPressed
    signal rightPressed
    signal leftHeld
    signal downHeld
    signal upHeld
    signal rightHeld
    signal leftReleased
    signal rightReleased
    signal upReleased
    signal downReleased

    property string leftButtonState: leftButton.state
    property string rightButtonState: rightButton.state
    property string downButtonState: downButton.state
    property string upButtonState: upButton.state

    property int dPadButtonWidth
    property int dPadButtonHeight

    property int leftButtonWidth
    property int leftButtonHeight
    property int rightButtonWidth
    property int rightButtonHeight
    property int downButtonWidth
    property int downButtonHeight
    property int upButtonWidth
    property int upButtonHeight

    property Image iconLeft
    property Image iconRight
    property Image iconDown
    property Image iconUp
    property Image iconDirPad

    property color leftColor
    property color rightColor
    property color downColor
    property color upColor

    property bool leftButtonVisible: true
    property bool upButtonVisible: true
    property bool downButtonVisible: true
    property bool rightButtonVisible: true

    property real buttonPressedOpacity
    property real buttonReleasedOpacity
    property real buttonOpacityDuration

    id: abstractDirPad
    objectName: "AbstractDirectionalPad"

    Component.onCompleted: {
        leftButton.held.connect(leftHeld)
        rightButton.held.connect(rightHeld)
        upButton.held.connect(upHeld)
        downButton.held.connect(downHeld)
        leftButton.released.connect(leftReleased)
        rightButton.released.connect(rightReleased)
        upButton.released.connect(upReleased)
        downButton.released.connect(downReleased)
    }
}
