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
            text: qsTr("TODODODO")
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            TextField {
                id: inputField
                placeholderText: "Input a new todo item"
            }

            Button {
                text: "Add"
                onClicked: {
                    todosContainer.addTodo(inputField.text)
                    inputField.text = ""
                }
                enabled: inputField.text
            }
        }


        Column {
            id: todosContainer
            anchors {
                left: parent.left
                right: parent.right
                leftMargin: 10
                rightMargin: 10
            }

            property list<CheckBox> todos

            function addTodo(txt) {
                todos.push(Qt.createQmlObject(
                `
                    import QtQuick
                    import QtQuick.Controls
                    CheckBox {
                        checked: false
                    }
                `, this))
                todos[todos.length-1].text = txt
            }

            function clearTodos() {
                todos.forEach(el => el.destroy())
                todos = []
            }         
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Reset"
            enabled: !!todosContainer.todos.length
            onClicked: todosContainer.clearTodos()
        }
    }
}
