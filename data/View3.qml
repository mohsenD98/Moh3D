import QtQuick
import QtQuick3D
import QtQuick.Controls
import QtQuick.Layouts

View3D {
  anchors.fill: parent
  environment: SceneEnvironment {
    backgroundMode: SceneEnvironment.Color
    clearColor: "#222222"
  }

  TestSceneContent {}

  FrustumCamera {
    id: cameraNode
    eulerRotation.x: -30
    z: 700
    y: 500
    top: 10
    bottom: -10
    left: realLeft
    right: 10

    // Workaround for API bug
    property real realLeft: -10
  }

  Pane {
    ColumnLayout {
      RowLayout {
        Label {
          text: "clipNear"
        }
        Slider {
          from: 1
          to: cameraNode.clipFar
          value: cameraNode.clipNear
          onValueChanged: cameraNode.clipNear = value
          stepSize: 1
        }
        Label {
          text: cameraNode.clipNear
        }
      }
      RowLayout {
        Label {
          text: "clipFar"
        }
        Slider {
          from: cameraNode.clipNear
          to: 5000
          value: cameraNode.clipFar
          onValueChanged: cameraNode.clipFar = value
          stepSize: 1
        }
        Label {
          text: cameraNode.clipFar
        }
      }
      RowLayout {
        Label {
          text: "top"
        }
        Slider {
          from: -50
          to: 50
          value: cameraNode.top
          onValueChanged: cameraNode.top = value
          stepSize: 1
        }
        Label {
          text: cameraNode.top
        }
      }
      RowLayout {
        Label {
          text: "bottom"
        }
        Slider {
          from: -50
          to: 50
          value: cameraNode.bottom
          onValueChanged: cameraNode.bottom = value
          stepSize: 1
        }
        Label {
          text: cameraNode.bottom
        }
      }
      RowLayout {
        Label {
          text: "left"
        }
        Slider {
          from: -50
          to: 50
          value: cameraNode.realLeft
          onValueChanged: cameraNode.realLeft = value
          stepSize: 1
        }
        Label {
          text: cameraNode.realLeft
        }
      }
      RowLayout {
        Label {
          text: "right"
        }
        Slider {
          from: -50
          to: 50
          value: cameraNode.right
          onValueChanged: cameraNode.right = value
          stepSize: 1
        }
        Label {
          text: cameraNode.right
        }
      }
    }
  }
}
