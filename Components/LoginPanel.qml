import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15

Item {
  property var user: userField.text
  property var password: passwordField.text
  property var session: sessionPanel.session

  readonly property int fieldHeight: 34
  readonly property int panelWidth: 280
  readonly property int uiFontSize: 13
  readonly property int fieldRadius: 12
  readonly property int columnSpacing: 8

  opacity: 0

  NumberAnimation on opacity {
    from: 0
    to: 1
    duration: 700
    easing.type: Easing.OutCubic
    running: true
  }

  Rectangle {
    id: loginBackground
    anchors.centerIn: parent
    width: panelWidth + 48
    height: column.implicitHeight + 48
    radius: 16
    visible: config.LoginBackground == "true" ? true : false
    color: "transparent"

    LinearGradient {
      anchors.fill: parent
      start: Qt.point(0, 0)
      end: Qt.point(parent.width, parent.height)
      gradient: Gradient {
        GradientStop { position: 0.0; color: "#ccffffff" }
        GradientStop { position: 0.5; color: "#44ffffff" }
        GradientStop { position: 1.0; color: "#88aaddff" }
      }
      layer.enabled: true
      layer.effect: OpacityMask {
        maskSource: Rectangle {
          width: loginBackground.width
          height: loginBackground.height
          radius: loginBackground.radius
        }
      }
    }

    Rectangle {
      anchors.fill: parent
      anchors.margins: 1
      radius: loginBackground.radius - 1
      color: config.bgDark
      opacity: config.opacityPanel
    }
  }

  Column {
    id: column
    spacing: columnSpacing
    z: 5
    width: panelWidth
    anchors.centerIn: parent

    UserField {
      id: userField
      height: fieldHeight
      width: parent.width
      fieldFontSize: uiFontSize
      fieldRadius: parent.parent.fieldRadius
    }

    Row {
      id: row
      spacing: 8
      anchors.horizontalCenter: parent.horizontalCenter
      PasswordField {
        id: passwordField
        width: panelWidth - loginButton.width - row.spacing
        height: fieldHeight
        fieldFontSize: uiFontSize
        fieldRadius: parent.parent.parent.fieldRadius
        onAccepted: loginButton.clicked()
      }
      Button {
        id: loginButton
        width: fieldHeight
        height: fieldHeight
        enabled: user != "" && password != "" ? true : false
        hoverEnabled: true
        icon {
          source: Qt.resolvedUrl("../icons/login.svg")
          color: config.textDefault
          width: 16
          height: 16
        }
        background: Rectangle {
          id: buttonBackground
          color: config.buttonBgNormal
          border.color: config.buttonBorderNormal
          border.width: 1
          radius: fieldRadius
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
      height: fieldHeight
      sessionFontSize: uiFontSize
    }
  }

  Component.onCompleted: {
    if (userField.text === "") {
      userField.forceActiveFocus()
    } else {
      passwordField.forceActiveFocus()
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
