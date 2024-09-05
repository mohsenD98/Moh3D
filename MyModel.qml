import QtQuick3D

Node {
    y: 50
    scale: Qt.vector3d(0.5, 0.5, 0.5)
    PrincipledMaterial {
        id: commonMaterial
        baseColor: "grey"
    }

    Model {
        source: "#Cylinder"
        scale: Qt.vector3d(0.5, 2, 0.5)
        materials: [
            commonMaterial
        ]
    }
    Model {
        source: "#Cone"
        y: 100
        materials: [
            commonMaterial
        ]
    }
}
