import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
  id: userField
  property int fieldFontSize: 16
  property int fieldRadius: 10
  property string defaultUser: ""
  selectByMouse: true
  echoMode: TextInput.Normal
  selectionColor: config.textDefault
  renderType: Text.NativeRendering
  leftPadding: 16
  rightPadding: 16
  font {
    family: config.Font
    pixelSize: fieldFontSize
    bold: false
  }
  color: config.textDefault
  horizontalAlignment: Text.AlignHLeft
  placeholderText: "Username"
  placeholderTextColor: config.textPlaceholder
  text: userModel.lastUser ? userModel.lastUser : defaultUser

  Repeater {
    model: userModel
    delegate: Item {
      Component.onCompleted: {
        var targetIndex = (userModel.lastIndex >= 0 && userModel.lastIndex < userModel.count) ? userModel.lastIndex : 0;
        if (index === targetIndex) {
          userField.defaultUser = name;
        }
      }
    }
  }
  background: Rectangle {
    id: userFieldBackground
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
