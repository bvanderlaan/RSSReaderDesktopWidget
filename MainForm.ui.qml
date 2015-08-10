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

import QtQuick 2.4
import QtQuick.Controls 1.2

MouseArea {
    id: root
    anchors.fill: parent
    hoverEnabled: true
    property color backgroundColour: "black"
    property real backgroundOpacity: 0.7
    property bool isMouseOverWindow: containsMouse
    property alias model: rssFeedList.model

    Rectangle{
        anchors.fill: parent
        color: root.backgroundColour
        opacity: root.backgroundOpacity
    }
    ScrollView {
        anchors.fill: parent

        ListView {
            id: rssFeedList
            anchors { left: parent.left; right: parent.right; }
            delegate: FeedDelegate {
                title: role_title
                publicationDate: role_publicationDate
                content: role_description
            }
        }
    }
    HeaderBar {
        anchors.top: parent.top
        anchors { left: parent.left; right: parent.right; }
        height: 40
        color: root.backgroundColour
        opacity: root.isMouseOverWindow ? 1.0 : 0.0
    }
}

