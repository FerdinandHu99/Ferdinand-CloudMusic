import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
Item {
    id: root
    //标题栏
    HeaderMain {
        id: headerMain
        width: root.width
        height: 50
    }
    //搜索结果弹窗
    FSearchRectangle {
        id: searchRect
        width: 350
        height: rootWindow.height * 0.8
        anchors {
            top: headerMain.bottom
            topMargin: 10
            left: root.left
            leftMargin: 220
        }
    }
}
