/*
 * Copyright 2015 ImaginativeThinking
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import QtQuick 2.0
import QtQuick.Layouts 1.1

Rectangle {
    id: root

    Behavior on opacity {
        NumberAnimation {
            duration: 250
        }
    }
    RowLayout {
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.fill: parent
        spacing: 0

        WhiteText {
            text: Qt.application.name
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 14
        }
        Item { Layout.fillWidth: true; height: 1; }
        Item {
            anchors { top: parent.top; bottom: parent.bottom; }
            width: 20

            Text {
                text: "X"
                color: exitButtonMouseArea.containsMouse ? "lightgrey" : "white"
                anchors.centerIn: parent
                font.pointSize: 14
            }
            MouseArea {
                id: exitButtonMouseArea
                anchors.fill: parent
                onClicked: Qt.quit()
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
            }
        }
    }
}

