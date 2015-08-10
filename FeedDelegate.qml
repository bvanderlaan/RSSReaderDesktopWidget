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

Item {
    anchors { left: parent.left; right: parent.right; }
    height: childrenRect.height + 20
    property alias title: feedTitle.text
    property alias publicationDate: feedDate.text
    property alias content: feedContent.text

    Column {
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors { left: parent.left; right: parent.right; }
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        height: childrenRect.height
        spacing: 8

        WhiteText {
            id: feedTitle
            anchors { left: parent.left; right: parent.right; }
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            font.bold: true
            font.pointSize: 14
        }
        WhiteText {
            id: feedDate
            anchors { left: parent.left; right: parent.right; }
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            font.italic: true
            font.pointSize: 12
        }
        WhiteText {
            id: feedContent
            anchors { left: parent.left; right: parent.right; }
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            font.pointSize: 12
        }
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            height: 2
            width: parent.width * 0.7
            color: "black"
        }
    }
}

