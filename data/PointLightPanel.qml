import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick3D

Pane {
    id: panel
    required property PointLight target
    property bool showShadowPanel: false
    ColumnLayout {
        ShadowPanel {
            target: panel.target
            visible: panel.showShadowPanel
        }
        GroupBox {
            title: "Position"
            ColumnLayout {
                RowLayout {
                    Label {
                        text: "X"
                    }
                    Slider {
                        from: -1000
                        to: 1500
                        value: panel.target.x
                        onValueChanged: panel.target.x = value
                    }
                    Label {
                        text: panel.target.x.toFixed(1)
                    }
                }
                RowLayout {
                    Label {
                        text: "Y"
                    }
                    Slider {
                        from: 0
                        to: 1000
                        value: panel.target.y
                        onValueChanged: panel.target.y = value
                    }
                    Label {
                        text: panel.target.y.toFixed(1)
                    }
                }
                RowLayout {
                    Label {
                        text: "Z"
                    }
                    Slider {
                        from: -1500
                        to: 1500
                        value: panel.target.z
                        onValueChanged: panel.target.z = value
                    }
                    Label {
                        text: panel.target.z.toFixed(1)
                    }
                }
            }
        }
        
        Label {
            text: "Brightness"
        }
        RowLayout {
            Slider {
                from: 0
                to: 3
                value: panel.target.brightness
                onValueChanged: panel.target.brightness = value
            }
            Label {
                text: panel.target.brightness.toFixed(1)
            }
        }
        GroupBox {
            title: "Color"
            ColumnLayout {
                RowLayout {
                    Label {
                        text: "R"
                    }
                    Slider {
                        from: 0
                        to: 1
                        value: panel.target.color.r
                        onValueChanged: panel.target.color.r = value
                    }
                    Label {
                        text: panel.target.color.r.toFixed(1)
                    }
                }
                RowLayout {
                    Label {
                        text: "G"
                    }
                    Slider {
                        from: 0
                        to: 1
                        value: panel.target.color.g
                        onValueChanged: panel.target.color.g = value
                    }
                    Label {
                        text: panel.target.color.g.toFixed(1)
                    }
                }
                RowLayout {
                    Label {
                        text: "B"
                    }
                    Slider {
                        from: 0
                        to: 1
                        value: panel.target.color.b
                        onValueChanged: panel.target.color.b = value
                    }
                    Label {
                        text: panel.target.color.b.toFixed(1)
                    }
                }
            }
        }
        GroupBox {
            title: "Fade"
            ColumnLayout {
                RowLayout {
                    Label {
                        text: "Constant"
                    }
                    Slider {
                        from: 0
                        to: 1
                        value: panel.target.constantFade
                        onValueChanged: panel.target.constantFade = value
                    }
                    Label {
                        text: panel.target.constantFade.toFixed(3)
                    }
                }
                RowLayout {
                    Label {
                        text: "Linear"
                    }
                    Slider {
                        from: 0
                        to: 1
                        value: panel.target.linearFade
                        onValueChanged: panel.target.linearFade = value
                    }
                    Label {
                        text: panel.target.linearFade.toFixed(3)
                    }
                }
                RowLayout {
                    Label {
                        text: "Quadratic"
                    }
                    Slider {
                        from: 0
                        to: 1
                        value: panel.target.quadraticFade
                        onValueChanged: panel.target.quadraticFade = value
                    }
                    Label {
                        text: panel.target.quadraticFade.toFixed(3)
                    }
                }
            }
        }
        GroupBox {
            id: easyFadeGroupBox
            property real attenuation: 1.0
            property real range: 5.0
            title: "Easy Fade"

            function updateFade() {
                panel.target.constantFade = 0.0
                panel.target.quadraticFade = 10000 / (range * range)
                panel.target.linearFade = attenuation * panel.target.quadraticFade
            }

            onAttenuationChanged: updateFade()
            onRangeChanged: updateFade()
            
            ColumnLayout {
                RowLayout {
                    Label {
                        text: "Attenuation"
                    }
                    Slider {
                        from: 0.0
                        to: 10.0
                        value: easyFadeGroupBox.attenuation
                        onValueChanged: easyFadeGroupBox.attenuation = value
                    }
                    Label {
                        text: easyFadeGroupBox.attenuation.toFixed(1)
                    }
                }
                RowLayout {
                    Label {
                        text: "Range"
                    }
                    Slider {
                        from: 0.001
                        to: 1500
                        value: easyFadeGroupBox.range
                        onValueChanged: easyFadeGroupBox.range = value
                    }
                    Label {
                        text: easyFadeGroupBox.range.toFixed(1)
                    }
                }
            }
        }
    }
}
