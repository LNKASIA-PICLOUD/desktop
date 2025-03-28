// SPDX-FileCopyrightText: 2024 Claudio Cambra <claudio.cambra@nextcloud.com>
// SPDX-License-Identifier: GPL-2.0-or-later

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Style 1.0
import "../../filedetails"
import "../../tray"

import com.nextcloud.desktopclient 1.0

Column {
    id: root

    signal fastEnumerationEnabledToggled(bool enabled)

    property bool fastEnumerationSet: false
    property bool fastEnumerationEnabled: true

    spacing: 0

    CheckBox {
        id: fastEnumerationEnabledCheckBox
        text: qsTr("Enable fast sync")
        checked: root.fastEnumerationEnabled
        onClicked: root.fastEnumerationEnabledToggled(checked)
    }

    EnforcedPlainTextLabel {
        id: fastEnumerationDescription
        background: Rectangle {
            color: Style.infoBoxBackgroundColor
            border.width: Style.infoBoxBorderWidth
            border.color: Style.infoBoxBorderColor
            radius: Style.slightlyRoundedButtonRadius
        }
        width: parent.width
        padding: Style.smallSpacing
        text: qsTr("Fast sync will only sync changes in files and folders within folders that have been explored. " +
                    "This can significantly increase responsiveness on initial configuration of virtual files. " +
                    "However, it will cause redundant downloads of files moved to an unexplored folder. ")
        wrapMode: Text.Wrap
        visible: fastEnumerationEnabled
    }
}
