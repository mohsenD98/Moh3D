import QtQuick
import QtQuick3D
import QtQuick.Controls

Window {
  width: 640
  height: 480
  visible: true
  title: qsTr("Hello World")

  Column {
    Slider {
      id: zS
      from: 200
      to: 500
      value: 200
    }
    Slider {
      id: xS
      from: -100
      to: 100
      value: 0
    }
    Slider {
      id: yS
      from: -100
      to: 100
      value: 0
    }
  }

  View3D {
    anchors.fill: parent

    PerspectiveCamera {
      id: camera
      z: zS.value
      x: xS.value
      y: yS.value
    }

    DirectionalLight {
      objectName: "light"
      color: "red"
    }

    Model {
      source: "#Cube"
      materials: [
        PrincipledMaterial {}
      ]

      eulerRotation.y: 30
    }
  }
}
