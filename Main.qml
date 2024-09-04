import QtQuick
import QtQuick3D
import QtQuick.Controls

Window {
  width: 640
  height: 480
  visible: true
  title: qsTr("Basic Element")

  Node {
    id: sceneRoot

    PerspectiveCamera {
      id: camera
      z: 300
    }

    DirectionalLight {}

    Model {
      source: "#Cube"
      materials: [
        PrincipledMaterial {}
      ]

      NumberAnimation on eulerRotation.y {
        from: 0
        to: 360
        duration: 5000
        running: true
        loops: Animation.Infinite
      }
    }
  }

  SplitView {
    anchors.fill: parent
    orientation: Qt.Vertical

    handle: Rectangle {
      implicitWidth: 4
      implicitHeight: 4
      color: SplitHandle.pressed ? "#81e889" : (SplitHandle.hovered ? Qt.lighter("#c2f4c6", 1.1) : "#c2f4c6")
    }

    View3D {
      id: view1
      SplitView.preferredHeight: parent.height * 0.5
      importScene: sceneRoot

      Model {
        source: "#Sphere"
        y: 100
        materials: [
          PrincipledMaterial {
            baseColor: "blue"
          }
        ]
      }
    }
    View3D {
      id: view2
      SplitView.preferredHeight: parent.height * 0.5
      importScene: sceneRoot
      environment.debugSettings.wireframeEnabled: true

      camera: debugCamera
      OrthographicCamera {
        id: debugCamera
        z: 300
      }
    }
  }
}
