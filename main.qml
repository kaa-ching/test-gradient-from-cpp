import QtQuick 2.5
import QtQuick.Window 2.2

Item {
    visible: true
    width: 640
    height: 480

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        id: myrect1
        border.color: "black"
        width: 400
        height: 200
        gradient:
            Gradient {
            GradientStop {position: 0.3; color: "#303030" }
            GradientStop {position: 0.7; color: "#707070" }
        }

        Text {
            text: "This should contain a colorful gradient.\nalas: it doesn't work?"
        }

    }

    function insertGrads1(aList) {
        for (var stop in aList) {
            var gr2 = 'import QtQuick 2.5; GradientStop { position: %1; color: "%2"}'.arg(stop).arg(aList[stop]);
            console.log(gr2);
            /* help what to do here */ Qt.createQmlObject(gr2, myrect1.gradient, "test"+stop);
        }
        console.log(myrect1.gradient);
    }

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: myrect1.bottom
        width: 400
        height: 200
        id: myrect2
        border.color: "black"

        Canvas {
            id: mycanvas
            anchors.fill: parent
            anchors.leftMargin: 1
            anchors.rightMargin: 1
            property var ctx
            property var list
            onPaint: {
                console.log("onPaint of myrect2");
                ctx = mycanvas.getContext('2d');
                ctx.beginPath();
                var gradient = ctx.createLinearGradient(50, 0, 50, mycanvas.height);
                for (var colstop in list) {
                    gradient.addColorStop(colstop, list[colstop]);
                }
                ctx.fillStyle = gradient;
                ctx.fillRect(0,0,mycanvas.width,mycanvas.height);
            }

        }
        Text {
            text: "This should also contain a colorful gradient.\nAt least this one works!"
        }

    }
    function insertGrads2(aList) {
        mycanvas.list = aList;
    }

}
