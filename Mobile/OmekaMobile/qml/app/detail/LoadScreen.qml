import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../../utils"
import "../base"

Rectangle {
    id: load
    anchors.fill: parent
    color: "#CCCCCC"
    enabled: bar.value !== 1
    opacity: enabled ? 1 : 0

    property real progress: 0

    //update progress bar
    onProgressChanged: {
        if(enabled) {
            bar.value = progress
        }
    }

    //fade transition
    Behavior on opacity {
        SequentialAnimation {
            PauseAnimation {duration: 200} //delay
            PropertyAnimation {}
        }
    }

    //block interaction
    MouseArea { anchors.fill: parent}

    //load display
    Column {
        width: parent.width
        height: childrenRect.height
        anchors.verticalCenter: parent.verticalCenter
        spacing: Resolution.applyScale(150)

        //progress indicator
        ProgressBar {
            id: bar
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: Resolution.applyScale(100)
            minimumValue: 0
            maximumValue: 1
            Behavior on value { PropertyAnimation{} }

            //custom style
            style: ProgressBarStyle {
                background: Rectangle {
                    radius: Resolution.applyScale(30)
                    color: Style.schemeColor3
                    implicitHeight: Resolution.applyScale(45)
                }
                progress: Rectangle {
                    radius: Resolution.applyScale(30)
                    color: Style.schemeColor1
                }
            }
        }

        //cancel load
        Button {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: Resolution.applyScale(450)
            height: Resolution.applyScale(150)
            onClicked: navigator.pop()
            text: "CANCEL"
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: control.width
                    implicitHeight: control.height
                    border.color: Style.schemeColor1
                    color: control.pressed ? Style.schemeColor1 : load.color
                }
                label: Text {
                    color: control.pressed ? "white" : Style.schemeColor1
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    text: control.text
                    font.pointSize: 13
                }
            }
        }
    }
}
