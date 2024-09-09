import QtQuick
import QtQuick3D
import QtQuick.Controls
import QtQuick.Layouts

View3D {
  id: view
  anchors.fill: parent
  environment: SceneEnvironment {
    backgroundMode: SceneEnvironment.Color
    clearColor: "#222222"
  }

  TestSceneContent {}

  CustomCamera {
    id: cameraNode
    eulerRotation.x: -30
    z: 700
    y: 500
    property real near: 10.0
    property real far: 5000.0
    property real fov: 60.0

    readonly property real fov_radians: fov * (Math.PI / 180.0)

    projection: Qt.matrix4x4(Math.cos(fov_radians / 2) / Math.sin(fov_radians / 2) * (view.height / view.width), 0, 0, 0, 0, Math.cos(fov_radians / 2) / Math.sin(fov_radians / 2), 0, 0, 0, 0, -(near + far) / (far - near), -(2.0 * near * far) / (far - near), 0, 0, -1, 0)
  }

  Pane {
    ColumnLayout {
      RowLayout {
        Label {
          text: "near"
        }
        Slider {
          from: 1
          to: cameraNode.far
          value: cameraNode.near
          onValueChanged: cameraNode.near = value
          stepSize: 1
        }
        Label {
          text: cameraNode.near
        }
      }
      RowLayout {
        Label {
          text: "far"
        }
        Slider {
          from: cameraNode.near
          to: 5000
          value: cameraNode.far
          onValueChanged: cameraNode.far = value
          stepSize: 1
        }
        Label {
          text: cameraNode.far
        }
      }
      RowLayout {
        Label {
          text: "fov"
        }
        Slider {
          from: 1
          to: 180
          value: cameraNode.fov
          onValueChanged: cameraNode.fov = value
          stepSize: 1
        }
        Label {
          text: cameraNode.fov
        }
      }
    }
  }
}
