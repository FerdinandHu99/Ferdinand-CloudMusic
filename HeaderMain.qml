/*******************************
       该文件完成标题栏的实现
*******************************/
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
Item {
    id: root
    //标题栏背景框，颜色：红色
    Rectangle {
        id: background_rect
        anchors.fill: parent
        color: "#EC4141"
    }

    //标题栏拖拽移动
    MouseArea {
        id: drag_mouse
        property real xmouse;
        property real ymouse;
        anchors.fill: parent
        //当按住鼠标不动时，记录下当前鼠标的位置
        onPressed: {
            xmouse = mouse.x
            ymouse = mouse.y
        }
        //当鼠标位置改变时，计算出鼠标位置变化的增量，并赋值给根窗口
        onPositionChanged: {
            rootWindow.x = rootWindow.x+(mouse.x-xmouse)
            rootWindow.y = rootWindow.y+(mouse.y-ymouse)
        }
//        onClicked: {
//            serachBox.cursorVisible = false
//        }
    }

    //Logo标致
    Image {
        id: logo_img
        width: 30
        height: 30
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/Images/HeaderMain/logo.png"
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 16
        }
    }
    Text {
        id: logo_text
        text: qsTr("网易云音乐")
        color: "white"
        anchors {
            verticalCenter: parent.verticalCenter
            left: logo_img.right
            leftMargin: 2
        }
        font {
            pixelSize: 19
            bold: true
        }
    }

    //后退按钮
    FRoundButton {
        id: frbtn_left
        radius: 12
        source: "qrc:/Images/HeaderMain/left.png"
        anchors {
            verticalCenter: parent.verticalCenter
            left: logo_text.right
            leftMargin: 86
        }
        onActiveFocusChanged: {
            console.log(activeFocus)
        }
    }

    //前进按钮
    FRoundButton {
        id: frbtn_right
        radius: 12
        source: "qrc:/Images/HeaderMain/right.png"
        anchors {
            verticalCenter: parent.verticalCenter
            left: frbtn_left.right
            leftMargin: 8
        }
    }

    //搜索框
    FSearchBox {
        id: serachBox
        width: 158
        height: 30
        radius: 20
        anchors {
            verticalCenter: parent.verticalCenter
            left: frbtn_right.right
            leftMargin: 13
        }
    }



    //听歌识曲
    FRoundButton {
        id: microphone_btn
        radius: 15
        source: "qrc:/Images/HeaderMain/microphone.png"
        anchors {
            verticalCenter: parent.verticalCenter
            left: serachBox.right
            leftMargin: 12
        }
        onClicked: {
            serachBox.focus = false
        }
    }

    //关闭按钮
    FButton {
        id: close_btn
        width: 15
        height: 15
        opacity: 0.9
        imageSource: "qrc:/Images/HeaderMain/close.png"
        anchors {
            right: parent.right
            rightMargin: 25
            verticalCenter: parent.verticalCenter
        }
        onClicked: {
            Qt.quit()
        }
    }

    //最大化按钮
    FButton {
        id: max_btn
        width: 15
        height: 15
        opacity: 0.9
        imageSource: "qrc:/Images/HeaderMain/max.png"
        anchors {
            right: close_btn.left
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }
        onClicked: {
            //判断是否全屏，不是全屏则开启全屏，否则关闭全屏
            if(rootWindow.visibility == Window.FullScreen)
            {
                rootWindow.showNormal()
                imageSource = "qrc:/Images/HeaderMain/max.png"
            }else {
                rootWindow.showFullScreen()
                imageSource = "qrc:/Images/HeaderMain/normal.png"
            }
        }
    }

    //最小化按钮
    FButton {
        id: min_btn
        width: 15
        height: 15
        opacity: 0.9
        imageSource: "qrc:/Images/HeaderMain/min.png"
        anchors {
            right: max_btn.left
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }
        onClicked: {
            rootWindow.showMinimized()
        }
    }

    //mini模式按钮
    FButton {
        id: mini_btn
        width: 15
        height: 15
        opacity: 0.9
        imageSource: "qrc:/Images/HeaderMain/mini.png"
        anchors {
            right: min_btn.left
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        id: divi_rect
        color: "white"
        width: 1
        height: 15
        opacity: 0.5
        anchors {
            right: mini_btn.left
            rightMargin: 18
            verticalCenter: parent.verticalCenter
        }
    }

    //消息按钮
    FButton {
        id: message_btn
        width: 20
        height: 20
        opacity: 0.9
        imageSource: "qrc:/Images/HeaderMain/message.png"
        anchors {
            right: divi_rect.left
            rightMargin: 15
            verticalCenter: parent.verticalCenter
        }
    }

    //设置按钮
    FButton {
        id: setup_btn
        width: 20
        height: 20
        opacity: 0.9
        imageSource: "qrc:/Images/HeaderMain/setup.png"
        anchors {
            right: message_btn.left
            rightMargin: 15
            verticalCenter: parent.verticalCenter
        }
    }

    //换肤按钮
    FButton {
        id: skin_btn
        width: 20
        height: 20
        opacity: 0.9
        imageSource: "qrc:/Images/HeaderMain/skin.png"
        anchors {
            right: setup_btn.left
            rightMargin: 15
            verticalCenter: parent.verticalCenter
        }
    }

    //vip按钮
    FButton {
        id: vip_btn
        width: 25
        height: 25
        opacity: 0.9
        imageSource: "qrc:/Images/HeaderMain/vip_no.png"
        anchors {
            right: skin_btn.left
            rightMargin: 30
            verticalCenter: parent.verticalCenter
        }
    }

    //用户名字
    Item {
        id: userName
        height: 20
        width: 110
        anchors {
            verticalCenter: parent.verticalCenter
            right: vip_btn.left
            rightMargin: 10
        }
        Text {
            id: userName_text
            height: userName.height
            color: "white"
            text: qsTr("两个人的歌...")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors {
                bottom: parent.bottom
                right: userName_img.left
                rightMargin: 2
            }
            font {
                pixelSize: 13
                bold: true
            }
        }
        Image {
            id: userName_img
            width: 15
            height: 15
            source: "qrc:/Images/HeaderMain/down.png"
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
            }
        }
        MouseArea {
            id: userName_mouseArea
            anchors.fill: userName
            hoverEnabled: true
            //当鼠标进入范围内，鼠标样式变成手指，并且不透明度变高
            onEntered: {
                cursorShape = Qt.PointingHandCursor
                userName.opacity = 1
            }
            //当鼠标离开范围时，鼠标样式变回箭头，并且不透明度变低
            onExited: {
                cursorShape = Qt.ArrowCursor
                userName.opacity = 0.8
            }
        }
    }

    //用户头像
    FCircularHead {
        id: userHead
        radius: 14    //设置圆形头像框半径大小
        source: "qrc:/Images/HeaderMain/head.jpg"
        anchors {
            right: userName.left
            rightMargin: 2
            verticalCenter: parent.verticalCenter
        }
    }


}
