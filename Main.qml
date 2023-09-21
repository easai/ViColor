import QtQuick
import QtQuick.Window

Window {
    width: 700
    height: 480
    color: "#d0d0d0"
    visible: true
    title: qsTr("ViColor")
    property var viList:[["màu xanh nước biển", "màu nâu", "màu xám","màu hồng"],
        ["màu tím", "màu đỏ", "màu trắng", "màu vàng"],
        ["màu đen","màu xanh lá cây","màu da cam","màu"]]
    property var enList:[["blue", "brown", "gray", "pink"],
        ["purple","red","white","yellow"],
        ["black","green","orange","lightgray"]]
    property var fontList:[["white", "white", "white", "black"],
        ["white","white","black","black"],
        ["white","white","black","black"]]
    Column{
        spacing: 5
        anchors.centerIn: parent
        Repeater{
            model: 3
            Row{
                required property int index
                property int rowIndex
                rowIndex: index
                spacing: 20
                Repeater{
                    id: repeater
                    model: 4
                    Rectangle{
                        required property int index
                        width: 150; height: 150
                        color: enList[rowIndex][index]
                        radius: 20
                        Text{
                            id: textId
                            width: 130
                            anchors.centerIn: parent
                            font.pointSize : 16
                            wrapMode: Text.Wrap
                            color: fontList[rowIndex][index]
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked:{
                                console.log(textId.text);
                                if(textId.text===""){
                                    textId.text=viList[rowIndex][index]
                                }else{
                                    textId.text="";
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
