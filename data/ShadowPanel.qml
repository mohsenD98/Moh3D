import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick3D

ColumnLayout {
    id: panel
    required property Light target
    CheckBox {
        text: "Light Enabled"
        checked: panel.target.visible
        onCheckedChanged: panel.target.visible = checked
    }
    CheckBox {
        text: "Casts Shadow"
        checked: panel.target.castsShadow
        onCheckedChanged: panel.target.castsShadow = checked
    }
}
