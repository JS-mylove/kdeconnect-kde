/*
 * Copyright 2015 Aleix Pol Gonzalez <aleixpol@kde.org>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License or (at your option) version 3 or any later version
 * accepted by the membership of KDE e.V. (or its successor approved
 * by the membership of KDE e.V.), which shall act as a proxy
 * defined in Section 14 of version 3 of the license.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import QtQuick 2.2
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import org.kde.kirigami 2.0 as Kirigami
import org.kde.kdeconnect 1.0

QtObject
{
    property alias pluginName: checker.pluginName
    property alias iconName: checker.iconName
    property alias loaded: checker.available
    property alias device: checker.device
    property var interfaceFactory
    property var component
    property var name

    readonly property var checker: PluginChecker {
        id: checker
    }
    property var onClick: () => {
        if (component === "" || !interfaceFactory)
            return;

        var obj = interfaceFactory.create(checker.device.id());
        var page = pageStack.push(
            component,
            { pluginInterface: obj,
              device: checker.device
            }
        );
        obj.parent = page
    }
}
