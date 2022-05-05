import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
//实现自定义圆形的按钮       -- 2022/4/19   by Ferdinand
Item {
    id: roundBtn
    property alias radius: roundBtn_rect.radius
    property alias source: roundBtn_img.source
    signal clicked()
    width: radius * 2
    height: width
    Rectangle {
        id: roundBtn_rect
        width: parent.width
        height: width
        color: "#E23E3E"
    }
    Image {
        id: roundBtn_img
        width: parent.width * 0.6
        height: parent.height * 0.6
        anchors.centerIn: parent
        antialiasing: true
    }
    //增加鼠标样式变化功能
    MouseArea {
        id: roundBtn_mouseArea
        anchors.fill: roundBtn
        hoverEnabled: true
        //当鼠标进入范围内，鼠标样式变成手指
        onEntered: {
            cursorShape = Qt.PointingHandCursor
        }
        //当鼠标离开范围时，鼠标样式变回箭头
        onExited: {
            cursorShape = Qt.ArrowCursor
        }
        onClicked: {
            roundBtn.clicked()
        }
    }
}
