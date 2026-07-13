import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
  id: userField
  selectByMouse: true
  echoMode: TextInput.Normal
  selectionColor: config.textDefault
  renderType: Text.NativeRendering
  leftPadding: 12
  rightPadding: 12
  font {
    family: config.Font
    pixelSize: config.FontSize
    bold: false
  }
  color: config.textDefault
  horizontalAlignment: Text.AlignHLeft
  placeholderText: "Username"
  placeholderTextColor: config.textPlaceholder
  text: userModel.lastUser
  background: Rectangle {
    id: userFieldBackground
    color: config.lineeditBgNormal
    border.color: config.lineeditBorderNormal
    border.width: 1
    radius: 8
    opacity: config.opacityDefault
    Behavior on border.color {
      ColorAnimation { duration: 200 }
    }
  }
  states: [
    State {
      name: "hovered"
      when: userField.hovered
      PropertyChanges {
        target: userFieldBackground
        border.color: config.lineeditBorderHovered
      }
    },
    State {
      name: "focused"
      when: userField.activeFocus
      PropertyChanges {
        target: userFieldBackground
        border.color: config.lineeditBorderFocused
      }
    }
  ]
}
