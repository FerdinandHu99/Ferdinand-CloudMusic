import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
//实现自定义圆形的按钮       -- 2022/4/19   by Ferdinand
Rectangle {
    id: searchBox
    color: "#E23E3E"
    property alias text_focus: serachBox_text.focus
    //搜索框图片
    Image {
        id: searchBox_img
        height: parent.height * 0.5
        width: height
        source: "qrc:/Images/HeaderMain/search.png"
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: height * 0.6
        }
    }
    //文字输入框
    TextField {
        id: serachBox_text
        height: parent.height
        focus: false
        anchors {
            verticalCenter: parent.verticalCenter
            left: searchBox_img.right
            leftMargin: 1
            right: parent.right
            rightMargin: 5
        }
        color: "white"                     //输入的文字颜色
        placeholderText: qsTr("陈奕迅")     //提示输入文本
        placeholderTextColor: "#F09E8C"    //提示输入文本的颜色
        font {
            pixelSize: 13
            bold: true
        }
        background: Rectangle {            //设置背景颜色
            color: "transparent"
        }
        selectByMouse: true                //可被鼠标选中
        onFocusChanged: {
            if(focusReason === Qt.MouseFocusReason)
            {
//                cursorVisible = false
                console.log("222")
            }
            console.log(focusReason)
        }
        onAccepted: {

        }

//        FocusScope {
//            anchors.fill: parent
//            onActiveFocusChanged: {
//                console.log(activeFocus)
//            }
//        }

//        onActiveFocusChanged: {
//            console.log(activeFocus)
//        }
//        MouseArea {
//            anchors.fill: parent
//            onExited: {
//                if(clicked())
//            }
//        }
    }

}
