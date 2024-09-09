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

  OrthographicCamera {
    id: cameraNode
    eulerRotation.x: -30
    z: 700
    y: 500
  }

  Pane {
    ColumnLayout {
      RowLayout {
        Label {
          text: "H Scale"
        }
        Slider {
          from: 0.001
          to: 2.0
          stepSize: 0.001
          value: cameraNode.horizontalMagnification
          onValueChanged: {
            cameraNode.horizontalMagnification = value
            if (syncCheckBox.checked)
              cameraNode.verticalMagnification = value
          }
        }
        Label {
          text: cameraNode.horizontalMagnification.toFixed(3)
        }
      }
      RowLayout {
        Label {
          text: "V Scale"
        }
        Slider {
          from: 0.001
          to: 2.0
          stepSize: 0.001
          value: cameraNode.verticalMagnification
          onValueChanged: {
            cameraNode.verticalMagnification = value
            if (syncCheckBox.checked)
              cameraNode.horizontalMagnification = value
          }
        }
        Label {
          text: cameraNode.verticalMagnification.toFixed(3)
        }
      }
      CheckBox {
        id: syncCheckBox
        text: "Synced"
        checked: false
      }
    }
  }
}
