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

  Node {
    id: originNode
    y: 500
    eulerRotation.x: -30
    PerspectiveCamera {
      id: cameraNode
      z: 700
      clipNear: 10
      clipFar: 5000
    }
  }

  OrbitCameraController {
    origin: originNode
    camera: cameraNode
  }

  Text {
    anchors.horizontalCenter: parent.horizontalCenter
    color: "white"
    text: "Click and drag to rotate, Cmd/Alt + click and drag to pan, Scroll-Wheel/Pinch to zoom"
  }
}
