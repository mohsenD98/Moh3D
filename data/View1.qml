
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

  PointLight {
    id: pointLight
    y: 100
    castsShadow: true
    shadowFactor: 50

    Model {
      source: "#Sphere"
      scale: Qt.vector3d(0.02, 0.02, 0.02)
      castsShadows: false
      receivesShadows: false
      materials: [
        PrincipledMaterial {
          baseColor: pointLight.color
          lighting: PrincipledMaterial.NoLighting
        }
      ]
    }
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

  PointLightPanel {
    target: pointLight
  }

  OriginGizmo {
    targetNode: cameraNode
    anchors.top: parent.top
    anchors.right: parent.right
    width: 100
    height: 100
  }
}
