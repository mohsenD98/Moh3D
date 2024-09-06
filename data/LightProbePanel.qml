import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick3D

Pane {
    id: panel
    required property SceneEnvironment environment
    ColumnLayout {
        Label {
            text: "Exposure"
        }
        RowLayout {
            Slider {
                from: 0
                to: 10
                value: panel.environment.probeExposure
                onValueChanged: panel.environment.probeExposure = value
            }
            Label {
                text: panel.environment.probeExposure.toFixed(1)
            }
        }
        Label {
            text: "Horizon"
        }
        RowLayout {
            Slider {
                from: 0
                to: 1
                value: panel.environment.probeHorizon
                onValueChanged: panel.environment.probeHorizon = value
            }
            Label {
                text: panel.environment.probeHorizon.toFixed(2)
            }
        }
        GroupBox {
            title: "Orientation"
            ColumnLayout {
                RowLayout {
                    Label {
                        text: "X"
                    }
                    Slider {
                        from: -180
                        to: 180
                        value: panel.environment.probeOrientation.x
                        onValueChanged: panel.environment.probeOrientation.x = value
                    }
                    Label {
                        text: panel.environment.probeOrientation.x.toFixed(0)
                    }
                }
                RowLayout {
                    Label {
                        text: "Y"
                    }
                    Slider {
                        from: -180
                        to: 180
                        value: panel.environment.probeOrientation.y
                        onValueChanged: panel.environment.probeOrientation.y = value
                    }
                    Label {
                        text: panel.environment.probeOrientation.y.toFixed(0)
                    }
                }
                RowLayout {
                    Label {
                        text: "Z"
                    }
                    Slider {
                        from: -180
                        to: 180
                        value: panel.environment.probeOrientation.z
                        onValueChanged: panel.environment.probeOrientation.z = value
                    }
                    Label {
                        text: panel.environment.probeOrientation.z.toFixed(0)
                    }
                }
            }
        }
        CheckBox {
            text: "Use as SkyBox"
            checked: panel.environment.backgroundMode == SceneEnvironment.SkyBox
            onCheckedChanged: {
                if (checked)
                    panel.environment.backgroundMode = SceneEnvironment.SkyBox
                else
                    panel.environment.backgroundMode = SceneEnvironment.Color   
            }
        }
    }
}
