import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
ApplicationWindow {
    id: rootWindow
    visible: true
    width: 1024
    height: 668
    flags: Qt.FramelessWindowHint
    FramelessPage {
        id: framelessPage
        anchors.fill: parent
    }
}
