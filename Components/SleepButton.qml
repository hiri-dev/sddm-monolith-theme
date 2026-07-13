import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
  property int btnSize: 48
  implicitHeight: sleepButton.height
  implicitWidth: sleepButton.width
  Button {
    id: sleepButton
    height: btnSize
    width: btnSize
    hoverEnabled: true
    icon {
      source: Qt.resolvedUrl("../icons/sleep.svg")
      color: config.textDefault
      width: Math.round(btnSize * 0.45)
      height: Math.round(btnSize * 0.45)
    }
    background: Rectangle {
      id: sleepButtonBackground
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
        when: sleepButton.down
        PropertyChanges {
          target: sleepButtonBackground
          color: config.buttonBgPressed
          border.color: config.buttonBorderPressed
          opacity: 1
        }
      },
      State {
        name: "hovered"
        when: sleepButton.hovered
        PropertyChanges {
          target: sleepButtonBackground
          color: config.buttonBgHovered0
          border.color: config.buttonBorderHovered
          opacity: 1
        }
      }
    ]
    onClicked: sddm.suspend()
  }
}
