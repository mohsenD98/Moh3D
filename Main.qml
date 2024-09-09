import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.AssetUtils

import Moh3D

Window {
  id: containerItem
  width: 800
  height: 640
  title: "View and Scene"
  visible: true

  Loader {
    anchors.fill: parent
    source: "file:///home/mohsen/Codes/Moh3D/Moh3D/data/View3.qml"
  }
}
