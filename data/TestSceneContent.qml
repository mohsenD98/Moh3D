import QtQuick
import QtQuick3D

pragma ComponentBehavior: Bound

Node {
    id: root
    property bool pickable: false

    component RandomColorModel : Model {
        id: model
        readonly property var sources: [
            "#Cube",
            "#Cone",
            "#Sphere",
            "#Cylinder"
        ]
        function getSource() : url {
            // pick a random source url from sources
            const randomIndex = Math.floor(Math.random() * sources.length)
            return sources[randomIndex]
        }

        source: getSource()

        materials: [
            PrincipledMaterial {
                function getRandomColor() : color {
                    return Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
                }
                baseColor: getRandomColor()
                roughness: 0.2
            }
        ]
    }

    DirectionalLight {
        eulerRotation.x: -35
        eulerRotation.y: -5
        ambientColor: Qt.rgba(0.2, 0.2, 0.2, 1.0)
    }

    Repeater3D {
        model: 25
        Repeater3D {  
            id: repeaterZ
            required property int index
            model: 10
            RandomColorModel {
                required property int index
                pickable: root.pickable
                x: index * 150 - (150 * 5)
                z: repeaterZ.index * 150 - (150 * 22)
            }
        }
    }
}
