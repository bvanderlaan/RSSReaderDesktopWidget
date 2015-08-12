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
    property alias screenToPutWidgetOn: widgetScreen.text
    property alias refreshRSSFeedIntervalinMilliseconds: rssRefreshInterval.text


    GridLayout  {
        anchors.fill: parent
        columns: 2
        columnSpacing: 5
        property int maxLabelWidth: Math.max( widgetPlacementLabel.implicitWidth, widgetScreenLabel.implicitWidth, rssRefreshIntervalLabel.implicitWidth )

        // ROW 1
        Label {
            id: widgetPlacementLabel
            width: parent.maxLabelWidth
            horizontalAlignment: Text.AlignRight
            anchors.verticalCenter: widgetPlacement.verticalCenter
            text: qsTr("Widget Placement:")
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
        Label {
            id: widgetScreenLabel
            width: parent.maxLabelWidth
            horizontalAlignment: Text.AlignRight
            anchors.verticalCenter: widgetScreen.verticalCenter
            text: qsTr("Screen To Put Widget On:")
        }
        TextField {
            id: widgetScreen
            Layout.fillWidth: true
            validator: IntValidator {bottom: 1; top: 2;}
        }

        // ROW 3
        Label {
            id: rssRefreshIntervalLabel
            width: parent.maxLabelWidth
            horizontalAlignment: Text.AlignRight
            anchors.verticalCenter: rssRefreshInterval.verticalCenter
            text: qsTr("Refresh the RSS feed every (ms):")
        }
        TextField {
            id: rssRefreshInterval
            Layout.fillWidth: true
            validator: IntValidator {bottom: 1000; top: 86400000;}
        }
    }
}

