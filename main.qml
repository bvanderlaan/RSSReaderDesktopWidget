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
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import QtQuick.XmlListModel 2.0
import QtQuick.Window 2.2
import Qt.labs.settings 1.0

ApplicationWindow {
    id: root
    width: 320
    height: Screen.desktopAvailableHeight
    x: 0
    y: 0
    visible: true
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint
    Component.onCompleted: feedRefreshTimer.start()

    Settings {
        id: settings
        property int refreshRSSFeedIntervalinMilliseconds: 900000 //15min
        property string rssFeedUrl: "http://news.yahoo.com/rss/topstories"
    }
    MainForm {
        model: feedModel
    }
    Timer {
        id: feedRefreshTimer
        interval: settings.refreshRSSFeedIntervalinMilliseconds
        repeat: true
        onTriggered: feedModel.reload()
    }
    XmlListModel {
        id: feedModel
        source: settings.rssFeedUrl
        query: "/rss/channel/item"
        onStatusChanged: {
            if ( status === XmlListModel.Error ) {
                console.error(qsTr("Error reading feed: %1").arg(feedModel.errorString()))
                errorReadingFeed.show( feedModel.errorString() )
            }
        }

        XmlRole {
            name: "role_title"
            query: "title/string()"
        }
        XmlRole {
            name: "role_publicationDate"
            query: "pubDate/string()"
        }
        XmlRole {
            name: "role_description"
            query: "fn:replace(description/string(), '\&lt;a href=.*\/a\&gt;', '')"  // Remove any links from the description
        }
        XmlRole {
            name: "role_link"
            query: "link/string()"
        }
    }
    MessageDialog {
        id: errorReadingFeed
        title: Qt.application.name
        icon: StandardIcon.Critical

        function show( messageDetails ){
            text = messageDetails
            open()
        }
    }
}