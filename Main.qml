import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "Components"

Item {
  id: root
  height: Screen.height
  width: Screen.width

  Rectangle {
    id: background
    anchors.fill: parent
    z: 0
    color: config.bgDefault
    focus: true
  }

  Image {
    id: backgroundImage
    anchors.fill: parent
    fillMode: Image.PreserveAspectCrop
    visible: config.CustomBackground == "true" ? true : false
    z: 1
    source: config.CustomBackground == "true" ? config.Background : ""
    asynchronous: false
    cache: true
    mipmap: true
    clip: true
  }

  FastBlur {
    id: blurEffect
    anchors.fill: backgroundImage
    source: backgroundImage
    radius: config.BlurRadius ? parseInt(config.BlurRadius) : 32
    visible: (config.CustomBackground == "true" && config.BlurEnabled == "true") ? true : false
    z: 2
  }

  MouseArea {
    id: backgroundClickArea
    anchors.fill: parent
    z: 2
    onClicked: {
      background.forceActiveFocus()
    }
  }

  Item {
    id: mainPanel
    z: 3
    anchors {
      fill: parent
      leftMargin: Screen.width * 0.02
      rightMargin: Screen.width * 0.02
    }

    Clock {
      id: clockItem
      visible: config.ClockEnabled == "true" ? true : false
      anchors.top: parent.top
      anchors.topMargin: Screen.height * 0.10
      anchors.horizontalCenter: config.ClockPosition == "left" ? undefined : (config.ClockPosition == "right" ? undefined : parent.horizontalCenter)
      anchors.left: config.ClockPosition == "left" ? parent.left : undefined
      anchors.right: config.ClockPosition == "right" ? parent.right : undefined
    }

    Row {
      id: powerRow
      anchors.bottom: parent.bottom
      anchors.bottomMargin: Screen.height * 0.04
      anchors.horizontalCenter: parent.horizontalCenter
      spacing: 12
      z: 5

      PowerButton {
        id: powerButton
        btnSize: 40
      }
      RebootButton {
        id: rebootButton
        btnSize: 40
      }
      SleepButton {
        id: sleepButton
        btnSize: 40
      }
    }

    LoginPanel {
      id: loginPanel
      anchors.top: clockItem.visible ? clockItem.bottom : parent.top
      anchors.bottom: powerRow.top
      anchors.left: parent.left
      anchors.right: parent.right
    }
  }
}
