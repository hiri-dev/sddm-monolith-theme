import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Item {
  property var user: userField.text
  property var password: passwordField.text
  property var session: sessionPanel.session
  property var inputHeight: 144
  property var inputWidth: 256

  Rectangle {
    id: loginBackground
    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }
    height: inputHeight * 1.5
    width: inputWidth * 1.5
    radius: 12
    visible: config.LoginBackground == "true" ? true : false
    color: config.bgDark
    opacity: config.opacityPanel
  }

  Row {
    spacing: 16
    anchors {
      bottom: parent.bottom
      horizontalCenter: parent.horizontalCenter
    }
    z: 5
    PowerButton {
      id: powerButton
    }
    RebootButton {
      id: rebootButton
    }
    SleepButton {
      id: sleepButton
    }
  }

  Column {
    id: column
    spacing: 12
    z: 5
    width: inputWidth
    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }
    UserField {
      id: userField
      height: 32
      width: parent.width
    }
    Row {
      id: row
      spacing: 8
      anchors.horizontalCenter: parent.horizontalCenter
      PasswordField {
        id: passwordField
        width: inputWidth - loginButton.width - row.spacing
        height: 32
        onAccepted: loginButton.clicked()
      }
      Button {
        id: loginButton
        width: 32
        height: 32
        enabled: user != "" && password != "" ? true : false
        hoverEnabled: true
        icon {
          source: Qt.resolvedUrl("../icons/login.svg")
          color: config.textDefault
        }
        background: Rectangle {
          id: buttonBackground
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
            when: loginButton.down
            PropertyChanges {
              target: buttonBackground
              color: config.buttonBgPressed
              border.color: config.buttonBorderPressed
              opacity: 1
            }
          },
          State {
            name: "hovered"
            when: loginButton.hovered
            PropertyChanges {
              target: buttonBackground
              color: config.buttonBgHovered0
              border.color: config.buttonBorderHovered
              opacity: 1
            }
          }
        ]
        onClicked: {
          sddm.login(user, password, session)
        }
      }
    }
    SessionPanel {
      id: sessionPanel
      width: parent.width
      height: 32
    }
  }

  Connections {
    target: sddm
    function onLoginFailed() {
      passwordField.text = ""
      passwordField.focus = true
    }
  }
}
