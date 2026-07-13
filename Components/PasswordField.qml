import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
  id: passwordField
  property int fieldFontSize: 16
  property int fieldRadius: 10
  focus: true
  selectByMouse: true
  placeholderText: "Password"
  placeholderTextColor: config.textPlaceholder
  echoMode: TextInput.Password
  passwordMaskDelay: config.PasswordShowLastLetter
  selectionColor: config.textDefault
  renderType: Text.NativeRendering
  leftPadding: 16
  rightPadding: 16
  font.family: config.Font
  font.pixelSize: fieldFontSize
  font.bold: false
  color: config.textDefault
  horizontalAlignment: TextInput.AlignHLeft
  background: Rectangle {
    id: passFieldBackground
    color: config.lineeditBgNormal
    border.color: config.lineeditBorderNormal
    border.width: 1
    radius: fieldRadius
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
