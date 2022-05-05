import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
//实现自定义的按钮       -- 2022/4/18   by Ferdinand
Item {
    id: root
    property string imageSource: "";  //背景图片的位置
    signal clicked();
    Image {
        anchors.fill: parent
        source: imageSource
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            root.clicked()
        }
        //当鼠标进入范围内，鼠标样式变成手指，并且不透明度变高
        onEntered: {
            cursorShape = Qt.PointingHandCursor
            root.opacity = 1
        }
        //当鼠标离开范围时，鼠标样式变回箭头，并且不透明度变低
        onExited: {
            cursorShape = Qt.ArrowCursor
            root.opacity = 0.8
        }
    }
}
