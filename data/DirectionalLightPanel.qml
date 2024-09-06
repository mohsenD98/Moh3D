import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick3D

Pane {
  id: panel
  required property DirectionalLight target
  property bool showShadowPanel: false
  ColumnLayout {
    ShadowPanel {
      target: panel.target
      visible: panel.showShadowPanel
    }
    GroupBox {
      title: "Rotation"
      ColumnLayout {
        RowLayout {
          Label {
            text: "X"
          }
          Slider {
            from: -180
            to: 180
            value: panel.target.eulerRotation.x
            onValueChanged: panel.target.eulerRotation.x = value
          }
          Label {
            text: panel.target.eulerRotation.x.toFixed(1)
          }
        }
        RowLayout {
          Label {
            text: "Y"
          }
          Slider {
            from: -180
            to: 180
            value: panel.target.eulerRotation.y
            onValueChanged: panel.target.eulerRotation.y = value
          }
          Label {
            text: panel.target.eulerRotation.y.toFixed(1)
          }
        }
        RowLayout {
          Label {
            text: "Z"
          }
          Slider {
            from: -180
            to: 180
            value: panel.target.eulerRotation.z
            onValueChanged: panel.target.eulerRotation.z = value
          }
          Label {
            text: panel.target.eulerRotation.z.toFixed(1)
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
  }
}
