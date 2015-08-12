import QtQuick 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import ca.imaginativethinking 1.0

Dialog {
    width: 400
    height: 170
    title: Qt.application.name + " " + qsTr("Settings")
    standardButtons: StandardButton.Save | StandardButton.Cancel
    property alias widgetPlacementIndex: widgetPlacement.currentIndex
    property alias screenToPutWidgetOn: widgetScreen.value
    property alias refreshRSSFeedIntervalinMilliseconds: rssRefreshInterval.text
    property alias rssUrl: rssFeedUrl.text

    Screens {
        id: screens
    }
    GridLayout  {
        anchors.fill: parent
        columns: 2
        columnSpacing: 5
        property int maxLabelWidth: Math.max( widgetPlacementLabel.implicitWidth, widgetScreenLabel.implicitWidth, rssRefreshIntervalLabel.implicitWidth, rssFeedUrlLabel.implicitWidth )

        // ROW 1
        Item {
            width: parent.maxLabelWidth
            height: childrenRect.height
            anchors.verticalCenter: widgetPlacement.verticalCenter

            Label {
                id: widgetPlacementLabel
                anchors.right: parent.right
                text: qsTr("Widget Placement:")
            }
        }
        ComboBox {
            id: widgetPlacement
            Layout.fillWidth: true
            textRole: "display"
            model: ListModel {
                ListElement {
                    display: "Left"
                    value: WidgetPositioner.ScreenPosition_Left
                }
                ListElement {
                    display: "Right"
                    value: WidgetPositioner.ScreenPosition_Right
                }
            }
        }

        // ROW 2
        Item {
            width: parent.maxLabelWidth
            height: childrenRect.height
            anchors.verticalCenter: widgetScreen.verticalCenter

            Label {
                id: widgetScreenLabel
                anchors.right: parent.right
                text: qsTr("Screen To Put Widget On:")
            }
        }
        SpinBox {
            id: widgetScreen
            Layout.fillWidth: true
            maximumValue: screens.numberOfScreens
            minimumValue: 1
        }

        // ROW 3
        Item {
            width: parent.maxLabelWidth
            height: childrenRect.height
            anchors.verticalCenter: rssRefreshInterval.verticalCenter

            Label {
                id: rssRefreshIntervalLabel
                anchors.right: parent.right
                text: qsTr("Refresh the RSS feed every (ms):")
            }
        }
        TextField {
            id: rssRefreshInterval
            Layout.fillWidth: true
            validator: IntValidator {bottom: 1000; top: 86400000;}
        }

        // ROW 4
        Item {
            width: parent.maxLabelWidth
            height: childrenRect.height
            anchors.verticalCenter: rssFeedUrl.verticalCenter

            Label {
                id: rssFeedUrlLabel
                text: qsTr("RSS URL:")
                anchors.right: parent.right
            }
        }
        TextField {
            id: rssFeedUrl
            Layout.fillWidth: true
        }
    }
}

