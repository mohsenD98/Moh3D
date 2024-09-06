import QtQuick3D

pragma ComponentBehavior: Bound

Node {
    id: root
    required property Light target
    rotation: target.sceneRotation
    position: target.scenePosition
    pivot.z: 50

    PrincipledMaterial {
        id: unlitColorMaterial
        baseColor: root.target.color
        lighting: PrincipledMaterial.NoLighting

    }

    Model {
        source: "#Cube"
        scale: Qt.vector3d(0.1, 0.1, 1)
        castsShadows: false
        receivesShadows: false
        materials: [ unlitColorMaterial ]
    }

    component ArrowArm : Model {
        source: "#Cube"
        z: -50
        pivot: Qt.vector3d(0, 0, -50)
        scale: Qt.vector3d(0.1, 0.1, 0.33)
        materials: [ unlitColorMaterial ]
        castsShadows: false
        receivesShadows: false
    }

    ArrowArm {
        x: -2.5
        eulerRotation.y: 45
    }
    ArrowArm {
        x: 2.5
        eulerRotation.y: -45
    }

}
