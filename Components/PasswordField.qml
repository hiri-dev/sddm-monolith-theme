import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
  id: passwordField
  focus: true
  selectByMouse: true
  placeholderText: "Password"
  placeholderTextColor: config.textPlaceholder
  echoMode: TextInput.Password
  passwordMaskDelay: config.PasswordShowLastLetter
  selectionColor: config.textDefault
  renderType: Text.NativeRendering
  leftPadding: 12
  rightPadding: 12
  font.family: config.Font
  font.pixelSize: config.FontSize
  font.bold: false
  color: config.textDefault
  horizontalAlignment: TextInput.AlignHLeft
  background: Rectangle {
    id: passFieldBackground
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
      when: passwordField.hovered
      PropertyChanges {
        target: passFieldBackground
        border.color: config.lineeditBorderHovered
      }
    },
    State {
      name: "focused"
      when: passwordField.activeFocus
      PropertyChanges {
        target: passFieldBackground
        border.color: config.lineeditBorderFocused
      }
    }
  ]
}
