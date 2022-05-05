import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
//实现圆形头像框的功能          -- 2022/4/18   by Ferdinand

Rectangle {
    id: userHead
    property alias source: userHead_img.source
    signal clicked()
    width: radius * 2
    height: radius * 2
    antialiasing: true   //开启抗锯齿
    //原始图像：不显示
    Image {
        id: userHead_img
        visible: false
        asynchronous: true   //开启异步加载
        anchors.fill: parent
    }
    //Mask图像：不显示
    Rectangle {
        id: userHead_mask
        color: "white"
        anchors.fill: parent
        radius: width/2
        visible: false
        antialiasing: true
    }
    //最终实际效果的图像：显示
    OpacityMask {
        id: userHead_maskImage
        anchors.fill: userHead
        source: userHead_img
        maskSource: userHead_mask
        visible: true
    }
    //增加鼠标样式变化功能
    MouseArea {
        id: userHead_mouseArea
        anchors.fill: userHead
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
            userHead.clicked()
        }
    }
}
