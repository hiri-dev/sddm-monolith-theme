import QtQuick 2.15

Item {
  id: clockRoot
  width: clockColumn.width
  height: clockColumn.height

  property string timeString: Qt.formatTime(new Date(), "HH:mm")
  property string dateString: Qt.formatDate(new Date(), "dddd, d MMMM yyyy")

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
      clockRoot.timeString = Qt.formatTime(new Date(), "HH:mm")
      clockRoot.dateString = Qt.formatDate(new Date(), "dddd, d MMMM yyyy")
    }
  }

  Column {
    id: clockColumn
    spacing: 6

    Text {
      id: timeText
      text: clockRoot.timeString
      color: config.textHighlight
      font.family: "Inter"
      font.styleName: "Black"
      font.pixelSize: 96
      font.weight: Font.Black
      font.letterSpacing: -2
      horizontalAlignment: Text.AlignHCenter
      anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
      id: dateText
      text: clockRoot.dateString
      color: config.textDefault
      font.family: "Inter"
      font.pixelSize: 17
      font.weight: Font.Normal
      font.letterSpacing: 0.5
      anchors.horizontalCenter: timeText.horizontalCenter
    }
  }
}
