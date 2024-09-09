import QtQuick
import QtQuick3D

View3D {
  id: view
  anchors.fill: parent
  environment: SceneEnvironment {
    backgroundMode: SceneEnvironment.Color
    clearColor: "#222222"
  }

  TestSceneContent {
    pickable: true
  }

  PerspectiveCamera {
    id: cameraNode
    eulerRotation.x: -30
    z: 700
    y: 500
    clipNear: 10
    clipFar: 5000
  }

  MouseArea {
    anchors.fill: parent

    onClicked: mouse => {
                 const result = view.pick(mouse.x, mouse.y)
                 if (result.objectHit != null) {
                   cameraNode.lookAt(result.scenePosition)
                 }
               }
  }

  Text {
    anchors.horizontalCenter: parent.horizontalCenter
    color: "white"
    text: "Click a model to target camera"
  }
}
