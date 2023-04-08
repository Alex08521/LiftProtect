import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2



Window {
    id: mainFrame
    width: 640
    height: 480
    visible: true
    color: "#c1c1c1"
    title: qsTr("Lift Inspector")

    property bool pi1: false
    property bool pi2: false
    property bool spdp: false
    property bool spdg: false
    property bool kp1: false
    property bool kp2: false
    property bool vp: false
    property bool vv: false
    property bool nvo: false
    property bool bdg: false
    property bool bdp: false

    property bool prevpi1: false
    property bool prevpi2: false
    property bool prevspdp: false
    property bool prevspdg: false
    property bool prevkp1: false
    property bool prevkp2: false
    property bool prevvp: false
    property bool prevvv: false
    property bool prevnvo: false
    property bool prevbdg: false
    property bool prevbdp: false


    Column {
        id: column
        x: 34
        y: 119
        width: 113
        height: 243
        spacing: 25

        RoundButton {
            id: button1
            x: 0
            y: 72
            width: 110
            height: 40
            radius: 15
            text: qsTr("Информвция")
            onClicked: {
                field1.visible = true;
                field2.visible = false;
                field3.visible = false;
                field4.visible = false;
            }
        }

        RoundButton {
            id: button2
            x: 0
            y: 72
            width: 110
            height: 40
            radius: 15
            text: qsTr("Журналы")
            onClicked: {
                field1.visible = false;
                field2.visible = true;
                field3.visible = false;
                field4.visible = false;
            }
        }

        RoundButton {
            id: button3
            x: 0
            y: 72
            width: 110
            height: 40
            radius: 15
            text: qsTr("Управление")
            onClicked: {
                field1.visible = false;
                field2.visible = false;
                field3.visible = true;
                field4.visible = false;
            }
        }

        RoundButton {
            id: button4
            x: 0
            y: 72
            width: 110
            height: 40
            radius: 15
            text: qsTr("Уведомления")
            onClicked: {
                field1.visible = false;
                field2.visible = false;
                field3.visible = false;
                field4.visible = true;
            }
        }
    }

    Rectangle {
        id: field1
        x: 194
        y: 42
        width: 403
        height: 397
        visible: true
        color: "#c1c1c1"
        radius: 5
        border.color: "#000000"
        border.width: 0

        Rectangle {
            id: rectmark1
            x: 53
            y: 92
            width: 40
            height: 40
            color: pi1 == false ? "lightgreen" : "red"
            radius: 18
            border.width: 2
        }

        Rectangle {
            id: rectmark2
            x: 127
            y: 92
            width: 40
            height: 40
            color: pi2 == false ? "lightgreen" : "red"
            radius: 18
            border.width: 2

        }

        Rectangle {
            id: gaslevelbackground
            x: 53
            y: 263
            width: 111
            height: 52
            color: "#ffffff"
            radius: 6
            border.color: "#020202"
        }

        Rectangle {
            id: temperaturebackground
            x: 251
            y: 260
            width: 111
            height: 52
            color: "#ffffff"
            radius: 6
            border.color: "#020202"
        }

        Rectangle {
            id: waterlevelbackgroud
            x: 256
            y: 84
            width: 111
            height: 52
            color: "#ffffff"
            radius: 6
            border.color: "#000000"
        }

        Text {
            id: text1
            x: 53
            y: 41
            width: 111
            height: 28
            text: qsTr("Извещатели")
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Tahoma"
            minimumPointSize: 15
            renderType: Text.QtRendering
            minimumPixelSize: 15
        }

        Text {
            id: text2
            x: 251
            y: 41
            width: 111
            height: 28
            text: qsTr("Уровень воды")
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            minimumPointSize: 15
            renderType: Text.QtRendering
            font.family: "Tahoma"
            minimumPixelSize: 15
        }

        Text {
            id: text3
            x: 53
            y: 222
            width: 111
            height: 28
            text: qsTr("Уровень газа")
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            minimumPointSize: 15
            renderType: Text.QtRendering
            font.family: "Tahoma"
            minimumPixelSize: 15
        }

        Text {
            id: text4
            x: 251
            y: 222
            width: 111
            height: 28
            text: qsTr("Температура")
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            minimumPointSize: 15
            renderType: Text.QtRendering
            font.family: "Tahoma"
            minimumPixelSize: 15
        }

        Text {
            id: text5
            x: 256
            y: 96
            width: 111
            height: 28
            text: baseConnection.getWaterLevel()
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            minimumPointSize: 15
            renderType: Text.QtRendering
            font.family: "Tahoma"
            minimumPixelSize: 15
        }

        Text {
            id: text6
            x: 251
            y: 275
            width: 111
            height: 28
            text: baseConnection.getTemperature()
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            minimumPointSize: 15
            renderType: Text.QtRendering
            font.family: "Tahoma"
            minimumPixelSize: 15
        }

        Text {
            id: text7
            x: 53
            y: 275
            width: 111
            height: 28
            text: baseConnection.getGasLevel()
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            minimumPointSize: 15
            renderType: Text.QtRendering
            font.family: "Tahoma"
            minimumPixelSize: 15
        }

        Text {
            id: text8
            x: 45
            y: 133
            width: 57
            height: 28
            text: qsTr("1")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            minimumPointSize: 15
            renderType: Text.QtRendering
            font.family: "Tahoma"
            minimumPixelSize: 15
        }

        Text {
            id: text9
            x: 119
            y: 133
            width: 57
            height: 28
            text: qsTr("2")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            minimumPointSize: 15
            renderType: Text.QtRendering
            font.family: "Tahoma"
            minimumPixelSize: 15
        }
    }

    Rectangle {
        id: field2
        x: 194
        y: 42
        width: 403
        height: 397
        visible: false
        color: "#c1c1c1"
        radius: 5
        border.color: "#000000"
        border.width: 0

        RowLayout{
            id: swichRow
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            RoundButton {
                id: roundButton
                text: "Срабатывания"
                font.pointSize: 8
                onClicked: {
                    tableSrab.visible = true;
                    tableBreaks.visible = false;
                    tableTO.visible = false;
                }
            }

            RoundButton {
                id: roundButton1
                text: "Сбои"
                Layout.minimumHeight: roundButton.height
                Layout.minimumWidth: roundButton.width
                onClicked: {
                    tableSrab.visible = false;
                    tableBreaks.visible = true;
                    tableTO.visible = false;
                }
            }

            RoundButton {
                id: roundButton2
                Layout.minimumHeight: roundButton.height
                Layout.minimumWidth: roundButton.width
                text: "Т.О."
                onClicked: {
                    tableSrab.visible = false;
                    tableBreaks.visible = false;
                    tableTO.visible = true
                }
            }
        }

        TableView {
            id: tableSrab
            anchors.top: swichRow.bottom
            anchors.topMargin: 15
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            visible: true

            TableViewColumn{
                role: "mname"
                title: "Оборудование"
                width: 190
            }

            TableViewColumn{
                role: "swOn"
                title: "Срабатывание"
                width: 110
            }

            TableViewColumn{
                role: "swDt"
                title: "Дата"
                width: 100
            }

            model: mySrabModel
        }

      TableView {
            id: tableTO
            anchors.top: swichRow.bottom
            anchors.topMargin: 15
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            visible: false

            TableViewColumn{
                role: "detail"
                title: "Деталь"
                width: 200
            }

            TableViewColumn{
                role: "dtRep"
                title: "Дата установки"
                width: 100
            }

            TableViewColumn{
                role: "dtChng"
                title: "Дата замены"
                width: 100
            }

            model: myTechModel
        }

        TableView {
            id: tableBreaks
            anchors.top: swichRow.bottom
            anchors.topMargin: 15
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            visible: false

            TableViewColumn{
                role: "brID"
                title: "Код ошибки"
                width: 100
            }

            TableViewColumn{
                role: "brDt"
                title: "Дата"
                width: 100
            }

            model: myBreakModel
        }
    }

    Rectangle {
        id: field3
        x: 194
        y: 42
        width: 403
        height: 397
        visible: false
        color: "#c1c1c1"
        radius: 5
        border.color: "#000000"
        border.width: 0

        Rectangle {
            id: switchField1
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 15
            width: 157
            height: 48
            color: "#bbbbbb"
            radius: 10
            border.width: 2

            Rectangle {
                id: greenLight1
                x: 4
                y: 13
                width: 25
                height: 25
                color: pi1 == false ? "darkgreen" : "lightgreen"
                radius: 12.5
                border.width: 1
            }

            Switch {
                id: switch1
                x: 35
                y: 8
                width: 129
                height: 32
                text: qsTr("ПИ-1")
                spacing: 12
                checked: pi1

                onClicked: {
                    pi1 = !pi1;
                }
            }
        }

        Rectangle {
            id: switchField2
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.left: switchField1.right
            anchors.leftMargin: 15
            width: 157
            height: 48
            color: "#bbbbbb"
            radius: 10
            border.width: 2

            Rectangle {
                id: greenLight2
                x: 4
                y: 13
                width: 25
                height: 25
                color: pi2 == false ? "darkgreen" : "lightgreen"
                radius: 12.5
                border.width: 1
            }

            Switch {
                id: switch2
                x: 35
                y: 8
                width: 129
                height: 32
                text: qsTr("ПИ-2")
                spacing: 12
                checked: pi2

                onClicked: {
                    pi2 = !pi2;
                }
            }
        }

        Rectangle {
            id: switchField3
            anchors.top: switchField1.bottom
            anchors.topMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 15
            width: 157
            height: 48
            color: "#bbbbbb"
            radius: 10
            border.width: 2

            Rectangle {
                id: greenLight3
                x: 4
                y: 13
                width: 25
                height: 25
                color: spdp == false ? "darkgreen" : "lightgreen"
                radius: 12.5
                border.width: 1
            }

            Switch {
                id: switch3
                x: 35
                y: 8
                width: 129
                height: 32
                text: qsTr("СПДП")
                spacing: 12
                checked: spdp

                onClicked: {
                    spdp = !spdp;
                }
            }
        }

        Rectangle {
            id: switchField4
            anchors.top: switchField2.bottom
            anchors.topMargin: 15
            anchors.left: switchField3.right
            anchors.leftMargin: 15
            width: 157
            height: 48
            color: "#bbbbbb"
            radius: 10
            border.width: 2

            Rectangle {
                id: greenLight4
                x: 4
                y: 13
                width: 25
                height: 25
                color: spdg == false ? "darkgreen" : "lightgreen"
                radius: 12.5
                border.width: 1
            }

            Switch {
                id: switch4
                x: 35
                y: 8
                width: 129
                height: 32
                text: qsTr("СПДГ")
                spacing: 12
                checked: spdg

                onClicked: {
                    spdg = !spdg;
                }
            }
        }

        Rectangle {
            id: switchField5
            anchors.top: switchField3.bottom
            anchors.topMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 15
            width: 157
            height: 48
            color: "#bbbbbb"
            radius: 10
            border.width: 2

            Rectangle {
                id: greenLight5
                x: 4
                y: 13
                width: 25
                height: 25
                color: kp1 == false ? "darkgreen" : "lightgreen"
                radius: 12.5
                border.width: 1
            }

            Switch {
                id: switch5
                x: 35
                y: 8
                width: 129
                height: 32
                text: qsTr("КП-1")
                spacing: 12
                checked: kp1

                onClicked: {
                    kp1 = !kp1;
                }
            }
        }

        Rectangle {
            id: switchField6
            anchors.top: switchField4.bottom
            anchors.topMargin: 15
            anchors.left: switchField5.right
            anchors.leftMargin: 15
            width: 157
            height: 48
            color: "#bbbbbb"
            radius: 10
            border.width: 2

            Rectangle {
                id: greenLight6
                x: 4
                y: 13
                width: 25
                height: 25
                color: kp2 == false ? "darkgreen" : "lightgreen"
                radius: 12.5
                border.width: 1
            }

            Switch {
                id: switch6
                x: 35
                y: 8
                width: 129
                height: 32
                text: qsTr("КП-2")
                spacing: 12
                checked: kp2

                onClicked: {
                    kp2 = !kp2;
                }
            }
        }

        Rectangle {
            id: switchField7
            anchors.top: switchField5.bottom
            anchors.topMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 15
            width: 157
            height: 48
            color: "#bbbbbb"
            radius: 10
            border.width: 2

            Rectangle {
                id: greenLight7
                x: 4
                y: 13
                width: 25
                height: 25
                color: vp == false ? "darkgreen" : "lightgreen"
                radius: 12.5
                border.width: 1
            }

            Switch {
                id: switch7
                x: 35
                y: 8
                width: 129
                height: 32
                text: qsTr("ВП")
                spacing: 12
                checked: vp

                onClicked: {
                    vp = !vp
                }
            }
        }

        Rectangle {
            id: switchField8
            anchors.top: switchField6.bottom
            anchors.topMargin: 15
            anchors.left: switchField7.right
            anchors.leftMargin: 15
            width: 157
            height: 48
            color: "#bbbbbb"
            radius: 10
            border.width: 2

            Rectangle {
                id: greenLight8
                x: 4
                y: 13
                width: 25
                height: 25
                color: vv == false ? "darkgreen" : "lightgreen"
                radius: 12.5
                border.width: 1
            }

            Switch {
                id: switch8
                x: 35
                y: 8
                width: 129
                height: 32
                text: qsTr("ВВ")
                spacing: 12
                checked: vv

                onClicked: {
                    vv = !vv;
                }
            }
        }

        Rectangle {
            id: switchField9
            anchors.top: switchField7.bottom
            anchors.topMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 15
            width: 157
            height: 48
            color: "#bbbbbb"
            radius: 10
            border.width: 2

            Rectangle {
                id: greenLight9
                x: 4
                y: 13
                width: 25
                height: 25
                color: bdp == false ? "darkgreen" : "lightgreen"
                radius: 12.5
                border.width: 1
            }

            Switch {
                id: switch9
                x: 35
                y: 8
                width: 129
                height: 32
                text: qsTr("БДП")
                spacing: 12
                checked: bdp

                onClicked: {
                    bdp = !bdp;
                }
            }
        }

        Rectangle {
            id: switchField10
            anchors.top: switchField8.bottom
            anchors.topMargin: 15
            anchors.left: switchField9.right
            anchors.leftMargin: 15
            width: 157
            height: 48
            color: "#bbbbbb"
            radius: 10
            border.width: 2

            Rectangle {
                id: greenLight10
                x: 4
                y: 13
                width: 25
                height: 25
                color: bdg == false ? "darkgreen" : "lightgreen"
                radius: 12.5
                border.width: 1
            }

            Switch {
                id: switch10
                x: 35
                y: 8
                width: 129
                height: 32
                text: qsTr("БДГ")
                spacing: 12
                checked: bdg

                onClicked: {
                    bdg = !bdg;
                }
            }
        }

        Rectangle {
            id: switchField11
            anchors.top: switchField9.bottom
            anchors.topMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 15
            width: 157
            height: 48
            color: "#bbbbbb"
            radius: 10
            border.width: 2

            Rectangle {
                id: greenLight11
                x: 4
                y: 13
                width: 25
                height: 25
                color: nvo == false ? "darkgreen" : "lightgreen"
                radius: 12.5
                border.width: 1
            }

            Switch {
                id: switch11
                x: 35
                y: 8
                width: 129
                height: 32
                text: qsTr("НВО")
                spacing: 12
                checked: nvo

                onClicked: {
                    nvo = !nvo;
                }
            }
        }

    }

    Rectangle {
        id: field4
        x: 194
        y: 42
        width: 403
        height: 397
        visible: false
        color: "#c1c1c1"
        radius: 5
        border.color: "#000000"
        border.width: 2

        TableView {
            id: tableUved
            anchors.fill: parent
            visible: parent.visible

            TableViewColumn{
                role: "messDate"
                title: "Дата"
                width: 150
            }

            TableViewColumn{
                role: "mess"
                title: "Уведомление"
                width: 250
            }

            model: myMessModel
        }
    }

    Timer {
            id: timer1
            interval: 500
            running: true

            onTriggered: {
                baseConnection.lockMutex();
                timer1.running = false;

                if(prevpi1 != pi1){
                    baseConnection.insertIntoTable(qsTr("SrabTable"), switch1.text, qsTr(String(new Date())), " ", pi1);
                }
                if(prevpi2 != pi2){
                    baseConnection.insertIntoTable(qsTr("SrabTable"), switch2.text, qsTr(String(new Date())), " ", pi2);
                }
                if(prevspdp != spdp){
                    baseConnection.insertIntoTable(qsTr("SrabTable"), switch3.text, qsTr(String(new Date())), " ", spdp);
                }
                if(prevspdg != spdg){
                    baseConnection.insertIntoTable(qsTr("SrabTable"), switch4.text, qsTr(String(new Date())), " ", spdg);
                }
                if(prevkp1 != kp1){
                    baseConnection.insertIntoTable(qsTr("SrabTable"), switch5.text, qsTr(String(new Date())), " ", kp1);
                }
                if(prevkp2 != kp2){
                    baseConnection.insertIntoTable(qsTr("SrabTable"), switch6.text, qsTr(String(new Date())), " ", kp2);
                }
                if(prevvp != vp){
                    baseConnection.insertIntoTable(qsTr("SrabTable"), switch7.text, qsTr(String(new Date())), " ", vp);
                }
                if(prevvv != vv){
                    baseConnection.insertIntoTable(qsTr("SrabTable"), switch8.text, qsTr(String(new Date())), " ", vv);
                }
                if(prevbdp != bdp){
                    baseConnection.insertIntoTable(qsTr("SrabTable"), switch9.text, qsTr(String(new Date())), " ", bdp);
                }
                if(prevbdg != bdg){
                    baseConnection.insertIntoTable(qsTr("SrabTable"), switch10.text, qsTr(String(new Date())), " ", bdg);
                }
                if(prevnvo != nvo){
                    baseConnection.insertIntoTable(qsTr("SrabTable"), switch11.text, qsTr(String(new Date())), " ", nvo);
                }

                pi1 = baseConnection.getSwitchFromSrabTable(switch1.text);
                pi2 = baseConnection.getSwitchFromSrabTable(switch2.text);
                spdp = baseConnection.getSwitchFromSrabTable(switch3.text);
                spdg = baseConnection.getSwitchFromSrabTable(switch4.text);
                kp1 = baseConnection.getSwitchFromSrabTable(switch5.text);
                kp2 = baseConnection.getSwitchFromSrabTable(switch6.text);
                vp = baseConnection.getSwitchFromSrabTable(switch7.text);
                vv = baseConnection.getSwitchFromSrabTable(switch8.text);
                bdp = baseConnection.getSwitchFromSrabTable(switch9.text);
                bdg = baseConnection.getSwitchFromSrabTable(switch10.text);
                nvo = baseConnection.getSwitchFromSrabTable(switch11.text);


                prevpi1 = pi1;
                prevpi2 = pi2;
                prevspdp = spdp;
                prevspdg = spdg;
                prevkp1 = kp1;
                prevkp2 = kp2;
                prevvp = vp;
                prevvv = vv;
                prevbdp = bdp;
                prevbdg = bdg;
                prevnvo = nvo;

                text7.text = baseConnection.getGasLevel();
                text6.text = baseConnection.getTemperature();
                text5.text = baseConnection.getWaterLevel();
                mySrabModel.updateModel();
                myTechModel.updateModel();
                myBreakModel.updateModel();
                myMessModel.updateModel();
                timer1.running = true;
                baseConnection.unlockMutex();
            }
     }

}
