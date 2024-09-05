import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

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

    Node {
      id: originNode
      eulerRotation.x: -25

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

    Text {
      anchors.bottom: parent.bottom
      anchors.horizontalCenter: parent.horizontalCenter
      color: "white"
      text: "Click and drag to rotate, Cmd/Alt + click and drag to pan, Scroll-Wheel/Pinch to zoom"
    }
  }
  Rectangle {
    id: originMarker
    width: 10
    height: width
    radius: width * 0.5
    color: "yellow"
    visible: false

    function updateState() {
      const scenePosition = cameraNode.mapToViewport(originNode.scenePosition)
      originMarker.x = scenePosition.x * containerItem.width - originMarker.radius
      originMarker.y = scenePosition.y * containerItem.height - originMarker.radius
      originMarker.visible = scenePosition.z > 0
    }

    Connections {
      target: cameraNode
      function onSceneTransformChanged() {
        originMarker.updateState()
      }
    }
    Connections {
      target: containerItem
      function onWidthChanged() {
        originMarker.updateState()
      }
      function onHeightChanged() {
        originMarker.updateState()
      }
    }
  }
}
