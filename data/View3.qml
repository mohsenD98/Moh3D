import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

View3D {
  id: view
  anchors.fill: parent
  environment: SceneEnvironment {
    backgroundMode: SceneEnvironment.Color
    clearColor: "#222222"
  }

  TestSceneContent {
    pickable: true
  }

  PerspectiveCamera {
    id: cameraNode
    eulerRotation.x: -30
    z: 700
    y: 500
    clipNear: 10
    clipFar: 5000
  }

  WasdController {
    controlledObject: cameraNode
  }

  Text {
    color: "white"
    text: "Click and drag to aim camera\nw: foward\ns: back\na: right\nd: left\nr: up\nf: down\nhold shift: move faster"
  }
}
