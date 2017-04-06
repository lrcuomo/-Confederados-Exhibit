import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

import "settings.js" as Settings

ApplicationWindow {
    visible: true
    width: Settings.SCREEN_WIDTH
    height: Settings.SCREEN_HEIGHT
    visibility: Settings.FULLSCREEN ? "FullScreen" : "Windowed";
    title: qsTr("OmekaTable2")

    Item
    {
        id: root
        focus: true
        Keys.onEscapePressed: Qt.quit()

        Rectangle
        {
            width: Settings.SCREEN_WIDTH
            height: Settings.SCREEN_HEIGHT
            color: "#e6e6e6"
        }

        Gallery
        {
            id: gallery
            width: Settings.SCREEN_WIDTH
            height: Settings.SCREEN_HEIGHT
            //onRemoveAttractImage:
            onCarouselActivate: {attract_pool.opacity = 0.0; attract_pool.stopAttractTimer(); attract_pool.carouselActivate = true;}
        }

        AttractPoolItem
        {
            id: attract_pool
            enabled: opacity == 1.0
            onCreateImage:
            {
                //console.log("create an image!")
                gallery.imageHolderCreateImage(source,imageX,imageY,imageRotation,imageWidth,imageHeight, tapOpen, whichScreen);
            }
        }
    }


}
