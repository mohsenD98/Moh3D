import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.AssetUtils

import Moh3D

View3D {
  anchors.fill: parent

  environment: SceneEnvironment {
    backgroundMode: SceneEnvironment.Color
    clearColor: "black"
  }

  RuntimeLoader {
    eulerRotation.y: 90
    scale: Qt.vector3d(100, 100, 100)
    source: "Sponza/Sponza.gltf"
  }

  SpotLight {
    id: spotLight
    y: 100
    linearFade: 0.011
    quadraticFade: 0.011
  }

  ForwardHelper {
    target: spotLight
  }

  Node {
    id: originNode
    eulerRotation.x: -20
    PerspectiveCamera {
      id: cameraNode
      z: 600
    }
  }

  OrbitCameraController {
    origin: originNode
    camera: cameraNode
  }

  SpotLightPanel {
    target: spotLight
  }

  OriginGizmo {
    targetNode: cameraNode
    anchors.top: parent.top
    anchors.right: parent.right
    width: 100
    height: 100
  }
}
