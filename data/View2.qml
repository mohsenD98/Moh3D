
import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.AssetUtils
import Moh3D

import QtQuick.Controls
import QtQuick.Layouts

View3D {
  id: view
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

  DirectionalLight {
    id: directionalLight
    y: 100
    shadowMapQuality: Light.ShadowMapQualityHigh
  }

  ForwardHelper {
    id: directionalLightHelper
    target: directionalLight
  }

  PointLight {
    id: pointLight
    y: 100
    shadowMapFar: 1000
    shadowMapQuality: Light.ShadowMapQualityHigh
    shadowFactor: 50

    Model {
      id: pointLightHelper
      source: "#Sphere"
      scale: Qt.vector3d(0.1, 0.1, 0.1)
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

  SpotLight {
    id: spotLight
    y: 100
    linearFade: 0.011
    quadraticFade: 0.011
    shadowMapFar: 1000
    shadowMapQuality: Light.ShadowMapQualityHigh
    shadowFactor: 50
  }

  ForwardHelper {
    id: spotLightHelper
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

  Pane {
    id: editorPane

    property DirectionalLight directional: directionalLight
    property PointLight point: pointLight
    property SpotLight spot: spotLight

    ColumnLayout {
      GroupBox {
        title: "Light to Edit"
        ColumnLayout {
          RadioButton {
            id: directionalRadioButton
            text: "Directional"
            checked: true
            autoExclusive: true
          }
          RadioButton {
            id: pointRadioButton
            text: "Point"
            autoExclusive: true
          }
          RadioButton {
            id: spotRadioButton
            text: "Spot"
            autoExclusive: true
          }
        }
      }

      DirectionalLightPanel {
        id: directionalLightPanel
        target: editorPane.directional
        showShadowPanel: true
      }
      PointLightPanel {
        id: pointLightPanel
        target: editorPane.point
        showShadowPanel: true
      }
      SpotLightPanel {
        id: spotLightPanel
        target: editorPane.spot
        showShadowPanel: true
      }
    }

    states: [
      State {
        name: "directional"
        when: directionalRadioButton.checked
        PropertyChanges {
          directionalLightPanel.visible: true
          pointLightPanel.visible: false
          spotLightPanel.visible: false
          directionalLightHelper.visible: true
          pointLightHelper.visible: false
          spotLightHelper.visible: false
        }
      },
      State {
        name: "point"
        when: pointRadioButton.checked
        PropertyChanges {
          directionalLightPanel.visible: false
          pointLightPanel.visible: true
          spotLightPanel.visible: false
          directionalLightHelper.visible: false
          pointLightHelper.visible: true
          spotLightHelper.visible: false
        }
      },
      State {
        name: "spot"
        when: spotRadioButton.checked
        PropertyChanges {
          directionalLightPanel.visible: false
          pointLightPanel.visible: false
          spotLightPanel.visible: true
          directionalLightHelper.visible: false
          pointLightHelper.visible: false
          spotLightHelper.visible: true
        }
      }
    ]
  }

  OriginGizmo {
    targetNode: cameraNode
    anchors.top: parent.top
    anchors.right: parent.right
    width: 100
    height: 100
  }
}
