import QtQuick
import org.dhruv8sh.kara

Item {
    PagerModel {
        id: pm
    }
    Component.onCompleted: {
        console.log("PagerModel loaded, count: " + pm.count)
    }
}
