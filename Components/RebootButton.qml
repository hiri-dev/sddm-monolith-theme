import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
  property int btnSize: 48
  implicitHeight: rebootButton.height
  implicitWidth: rebootButton.width
  visible: sddm.canReboot
  Button {
    id: rebootButton
    height: btnSize
    width: btnSize
    hoverEnabled: true
    icon {
      source: Qt.resolvedUrl("../icons/reboot.svg")
      color: config.textDefault
      width: Math.round(btnSize * 0.45)
      height: Math.round(btnSize * 0.45)
    }
    background: Rectangle {
      id: rebootButtonBackground
      color: config.buttonBgNormal
      border.color: config.buttonBorderNormal
      border.width: 1
      radius: 10
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
