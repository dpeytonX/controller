import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    MainPage {
        id: mainPage
    }

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status === DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem {
                id: dpadItem
                text: qsTr("Directional Pad")
                onClicked: {
                    var curPage = pageStack.currentPage
                    if(!!curPage && !!curPage.objectName && curPage.objectName != "mainPage") {
                        pageStack.replace(Qt.resolvedUrl("MainPage.qml"))
                    }
                }
            }

            MenuItem {
                id: styleDirPadItem
                text: qsTr("Styled Pad")
                onClicked: {
                    var curPage = pageStack.currentPage
                    if(!!curPage && !!curPage.objectName && curPage.objectName != "styleDirPad") {
                        pageStack.replace(Qt.resolvedUrl("StyleDirPad.qml"))
                    }
                }
            }

            MenuItem {
                id: quitItem
                text: qsTr("Quit")
                onClicked: {
                    console.log("Quitting")
                    Qt.quit()
                }
            }
        }
    }
}
