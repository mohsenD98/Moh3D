import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.AssetUtils
import Moh3D

View3D {
  id: view
  anchors.fill: parent

  environment: SceneEnvironment {
    backgroundMode: SceneEnvironment.Color
    clearColor: "black"
    lightProbe: Texture {
      // Swap these out to use your own .hdr or .exr file
      //source: "pathToYourHDRIFile.exr"
      textureData: ProceduralSkyTextureData {}
    }
  }

  RuntimeLoader {
    eulerRotation.y: 90
    scale: Qt.vector3d(100, 100, 100)
    source: "Sponza/Sponza.gltf"
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

  LightProbePanel {
    environment: view.environment
  }

  OriginGizmo {
    targetNode: cameraNode
    anchors.top: parent.top
    anchors.right: parent.right
    width: 100
    height: 100
  }
}
