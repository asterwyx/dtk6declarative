import QtQuick 2.0
import QtQuick.Controls 2.4

Item {
    id: control
    property alias source: image.source
    signal clicked
    default property alias content: loader.sourceComponent
    implicitWidth: childrenRect.width
    implicitHeight: childrenRect.height
    Image {
        id: image
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (loader.item) {
                    if (loader.item.hasOwnProperty("popup")) {
                        loader.item.popup(control)
                    } else if (loader.item.hasOwnProperty("open")) {
                        loader.item.open()
                    }
                }
                control.clicked()
            }
        }
        Loader {
            id: loader
        }
    }
}