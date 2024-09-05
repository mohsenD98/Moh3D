import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.AssetUtils

Window {
  id: containerItem
  width: 800
  height: 640
  title: "View and Scene"
  visible: true

  View3D {
    anchors.fill: parent
    environment: SceneEnvironment {
      backgroundMode: SceneEnvironment.Color
      clearColor: "black"
      InfiniteGrid {
        gridInterval: 100
      }
    }

    DirectionalLight {}

    RuntimeLoader {
      scale: Qt.vector3d(1000, 1000, 1000)
      source: "BoomBox.glb"
    }

    Node {
      id: originNode
      eulerRotation.x: -20
      PerspectiveCamera {
        id: cameraNode
        z: 300
      }
    }

    OrbitCameraController {
      origin: originNode
      camera: cameraNode
    }

    OriginGizmo {
      targetNode: cameraNode
      anchors.top: parent.top
      anchors.right: parent.right
      width: 100
      height: 100
    }
  }
}
