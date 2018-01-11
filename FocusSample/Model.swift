//
//  Model.swift
//  FocusSample
//
//  Created by José Luis Sanchez Porro on 11/1/18.
//  Copyright © 2018 José Luis Sanchez Porro. All rights reserved.
//
import UIKit

func generateModel () -> [[DataItem]]{
    
    let lonStrip = 15
    let numbrerOfRows = 7
    var arrayToReturn = [ [DataItem]]()
    var ima = UIImage(named:"Amy_POS_L")!
    for _ in 0...numbrerOfRows {
        var arrayOfImages = [DataItem]()
        for _ in 0...lonStrip {
            var item: DataItem = DataItem(image: ima, title: "Hola")
            
            arrayOfImages.append( item)
        }
        arrayToReturn.append(arrayOfImages)
    }
    return arrayToReturn
}

class DataItem {
    let title: String
    var image: UIImage
    
    init(image: UIImage, title: String) {
        self.image = image
        self.title = title
    }
}
