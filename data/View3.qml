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

  PerspectiveCamera {
    id: cameraNode
    eulerRotation.x: -30
    z: 700
    y: 500
    clipNear: 10
    clipFar: 4000
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
          text: "FieldOfView"
        }
        Slider {
          from: 1
          to: 180
          value: cameraNode.fieldOfView
          onValueChanged: cameraNode.fieldOfView = value
          stepSize: 1
        }
        Label {
          text: cameraNode.fieldOfView
        }
      }
      GroupBox {
        title: "FOV Orientation"
        ColumnLayout {
          RadioButton {
            text: "Vertical"
            autoExclusive: true
            checked: cameraNode.fieldOfViewOrientation == PerspectiveCamera.Vertical
            onCheckedChanged: cameraNode.fieldOfViewOrientation = PerspectiveCamera.Vertical
          }
          RadioButton {
            text: "Horizontal"
            checked: cameraNode.fieldOfViewOrientation == PerspectiveCamera.Horizontal
            onCheckedChanged: cameraNode.fieldOfViewOrientation = PerspectiveCamera.Horizontal
          }
        }
      }
    }
  }
}
