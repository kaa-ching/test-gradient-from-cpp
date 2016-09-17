import QtQuick 2.5
import QtQuick.Window 2.2

Item {
    visible: true
    width: 640
    height: 480

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        id: myrect
        border.color: "black"
        width: 400
        height: 200
        gradient:
            Gradient {
            GradientStop {position: 0.3; color: "#303030" }
            GradientStop {position: 0.7; color: "#707070" }
        }

        Text {
            text: "This should contain a colorful gradient."
        }

    }

    function insertGrads(aList) {
        for (var stop in aList) {
            var gr2 = 'import QtQuick 2.5; GradientStop { position: %1; color: "%2"}'.arg(stop).arg(aList[stop]);
            console.log(gr2);
            /* help what to do here */ Qt.createQmlObject(gr2, myrect.gradient, "test"+stop);
        }
        console.log(myrect.gradient);
    }

}
