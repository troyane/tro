// https://github.com/troyane/tro
//
// main.qml

import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Controls.Private 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Let's test tooltips!")

    Label {
        id: label
        property string tooltip: "Long string with <b>\\n</b> \n and it really
works well on desktop.\n Also it works <i><well/i> with <sup>reduced</sup>
subset of <sub>HTML</sub> <font color=\"red\">tags</font> <b>&#x263a;</b>"

        function showTooltip() {
            Tooltip.showText(mouseArea, Qt.point(mouseArea.mouseX, mouseArea.mouseY), label.tooltip)
        }

        text: "Move mouse over here!"
        anchors.centerIn: parent

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onExited: Tooltip.hideText()
            onCanceled: Tooltip.hideText()
            // onClicked: label.showTooltip()
        }

        Timer {
            interval: 1000
            running: mouseArea.containsMouse && label.tooltip.length
            onTriggered: label.showTooltip()
        }
    }
}
