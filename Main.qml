import QtQuick
import QtQuick3D
import QtQuick.Controls

Window {
  width: 640
  height: 480
  visible: true
  title: qsTr("Basic Element")

  Grid {
    columns: 2
    spacing: 8
    Text {
      text: "z"
    }

    Slider {
      id: zS
      from: 200
      to: 500
      value: 200
    }

    Text {
      text: "x"
    }

    Slider {
      id: xS
      from: -100
      to: 100
      value: 0
    }

    Text {
      text: "y"
    }

    Slider {
      id: yS
      from: -100
      to: 100
      value: 0
    }

    Text {
      text: "zr"
    }

    Slider {
      id: zrS
      from: 0
      to: 360
      value: 0
    }

    Text {
      text: "xr"
    }

    Slider {
      id: xrS
      from: 0
      to: 360
      value: 0
    }

    Text {
      text: "yr"
    }

    Slider {
      id: yrS
      from: 0
      to: 360
      value: 30
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

      eulerRotation.y: yrS.value
      eulerRotation.x: xrS.value
      eulerRotation.z: zrS.value
    }
  }
}
