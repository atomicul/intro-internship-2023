// Copyright (C) 2017 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls

ScrollablePage {
    id: page

    Column {
        spacing: 40
        width: parent.width

        Label {
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Qt.AlignHCenter
            text: qsTr("OMG temperature control so cool :O")
        }

        Dial {
            id: dial
            value: 0.5
            anchors.horizontalCenter: parent.horizontalCenter

            readonly property int minTemperature: 10
            readonly property int maxTemperature: 35
            readonly property int temperature: minTemperature+Math.round(value*(maxTemperature-minTemperature));

            Text {
                anchors.centerIn: parent
                text: `${parent.temperature} C`
                font.pointSize: 20
            }
        }

        Row {
            id: buttonSection
            width: parent.width
            height: 60

            Rectangle {
                id: section1
                height: parent.height
                width: parent.width / 2

                Button {
                    anchors.centerIn: parent
                    text: "Cold"
                    onClicked: dial.value = 0.0
                }
            }

             Rectangle {
                id: section2
                height: parent.height
                width: parent.width / 2

                Button {
                    anchors.centerIn: parent
                    text: "Warm"
                    onClicked: dial.value = 1.0
                }
            }
        }
    }
}
