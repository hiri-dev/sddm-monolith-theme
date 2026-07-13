import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
  implicitHeight: rebootButton.height
  implicitWidth: rebootButton.width
  Button {
    id: rebootButton
    height: 32
    width: 32
    hoverEnabled: true
    icon {
      source: Qt.resolvedUrl("../icons/reboot.svg")
      color: config.textDefault
    }
    background: Rectangle {
      id: rebootButtonBackground
      color: config.buttonBgNormal
      border.color: config.buttonBorderNormal
      border.width: 1
      radius: 8
      opacity: config.opacityDefault
      Behavior on color {
        ColorAnimation { duration: 200 }
      }
      Behavior on border.color {
        ColorAnimation { duration: 200 }
      }
    }
    states: [
      State {
        name: "pressed"
        when: rebootButton.down
        PropertyChanges {
          target: rebootButtonBackground
          color: config.buttonBgPressed
          border.color: config.buttonBorderPressed
          opacity: 1
        }
      },
      State {
        name: "hovered"
        when: rebootButton.hovered
        PropertyChanges {
          target: rebootButtonBackground
          color: config.buttonBgHovered0
          border.color: config.buttonBorderHovered
          opacity: 1
        }
      }
    ]
    onClicked: sddm.reboot()
  }
}
