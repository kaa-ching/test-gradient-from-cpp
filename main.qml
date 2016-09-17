import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            id: "rect"
            objectName: "rect"
            border.color: "black"
            width: 400
            height: 200
            gradient:
                Gradient {
                id: gradje

            }

            Text {
                text: "This should contain a gradient"
            }
        }

}
