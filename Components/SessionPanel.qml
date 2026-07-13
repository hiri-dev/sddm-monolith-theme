import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQml.Models 2.15

Item {
  property int sessionFontSize: 16
  property var session: sessionList.currentIndex
  property string currentSessionName: sessionList.currentItem ? sessionList.currentItem.sessionName : "Session"
  property int hoverCount: 0
  implicitHeight: sessionButton.height
  implicitWidth: sessionButton.width

  DelegateModel {
    id: sessionWrapper
    model: sessionModel
    delegate: ItemDelegate {
      id: sessionEntry
      height: 36
      width: parent.width
      property string sessionName: name
      onHoveredChanged: {
        if (hovered) {
          hoverCount++
        } else {
          hoverCount--
        }
      }
      contentItem: Text {
        renderType: Text.NativeRendering
        font.family: config.Font
        font.pixelSize: sessionFontSize
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: sessionEntry.hovered || (sessionList.currentIndex == index && hoverCount <= 0) ? config.textHighlight : config.textDefault
        text: name
      }
      background: Rectangle {
        color: sessionEntry.hovered ? config.viewitemBgHovered : (sessionList.currentIndex == index && hoverCount <= 0 ? config.viewitemBgPressed : "transparent")
        border.color: sessionEntry.hovered ? config.viewitemBorderHovered : (sessionList.currentIndex == index && hoverCount <= 0 ? config.viewitemBorderPressed : "transparent")
        border.width: 1
        radius: 10
        Behavior on color {
          ColorAnimation { duration: 150 }
        }
      }
      MouseArea {
        anchors.fill: parent
        onClicked: {
          sessionList.currentIndex = index
          sessionPopup.close()
        }
      }
    }
  }

  Button {
    id: sessionButton
    anchors.fill: parent
    hoverEnabled: true
    contentItem: Item {
      Item {
        id: iconWrapper
        width: 16
        height: 16
        anchors {
          left: parent.left
          leftMargin: 10
          verticalCenter: parent.verticalCenter
        }
        Image {
          id: sessionIcon
          anchors.fill: parent
          source: Qt.resolvedUrl("../icons/session.svg")
          sourceSize.width: 16
          sourceSize.height: 16
          opacity: sessionButton.hovered || sessionButton.down ? 1.0 : 0.85
        }
      }
      Text {
        id: sessionText
        text: currentSessionName
        color: sessionButton.hovered || sessionButton.down ? config.textHighlight : config.textDefault
        font.family: config.Font
        font.pixelSize: sessionFontSize
        font.bold: true
        anchors {
          left: iconWrapper.right
          leftMargin: 8
          verticalCenter: parent.verticalCenter
        }
      }
      Text {
        text: "▼"
        color: sessionButton.hovered || sessionButton.down ? config.textHighlight : config.textDefault
        font.family: config.Font
        font.pixelSize: 8
        anchors {
          right: parent.right
          rightMargin: 10
          verticalCenter: parent.verticalCenter
        }
      }
    }
    background: Rectangle {
      id: sessionButtonBackground
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
        when: sessionButton.down
        PropertyChanges {
          target: sessionButtonBackground
          color: config.buttonBgPressed
          border.color: config.buttonBorderPressed
          opacity: 1
        }
      },
      State {
        name: "hovered"
        when: sessionButton.hovered
        PropertyChanges {
          target: sessionButtonBackground
          color: config.buttonBgHovered0
          border.color: config.buttonBorderHovered
          opacity: 1
        }
      },
      State {
        name: "focused"
        when: sessionButton.activeFocus
        PropertyChanges {
          target: sessionButtonBackground
          color: config.buttonBgFocused0
          border.color: config.buttonBorderFocused
          opacity: 1
        }
      }
    ]
    onClicked: {
      sessionPopup.visible ? sessionPopup.close() : sessionPopup.open()
      sessionButton.state = "pressed"
    }
  }

  Popup {
    id: sessionPopup
    width: sessionButton.width
    x: 0
    y: sessionButton.height + 8
    padding: 8
    background: Rectangle {
      color: config.buttonBgNormal
      border.color: config.buttonBorderNormal
      border.width: 1
      radius: 10
    }
    contentItem: ListView {
      id: sessionList
      implicitHeight: contentHeight
      spacing: 8
      model: sessionWrapper
      currentIndex: sessionModel.lastIndex
      clip: true
      focus: true
    }
    onOpened: sessionList.forceActiveFocus()
    enter: Transition {
      ParallelAnimation {
        NumberAnimation {
          property: "opacity"
          from: 0
          to: 1
          duration: 400
          easing.type: Easing.OutExpo
        }
        NumberAnimation {
          property: "y"
          from: sessionPopup.y - 10
          to: sessionPopup.y
          duration: 400
          easing.type: Easing.OutExpo
        }
      }
    }
    exit: Transition {
      NumberAnimation {
        property: "opacity"
        from: 1
        to: 0
        duration: 300
        easing.type: Easing.OutExpo
      }
    }
  }
}
