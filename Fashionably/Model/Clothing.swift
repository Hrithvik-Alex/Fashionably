//
//  File.swift
//  Fashionably
//
//  Created by Hrithvik  Alex on 2019-01-12.
//  Copyright © 2019 Hrithvik  Alex. All rights reserved.
//

import Foundation
import RealmSwift

class Clothing: Object {
    @objc dynamic var image: UIImage
    @objc dynamic var type : String = ""// Upper body, lower body, feet
    @objc dynamic var warmthRating : Double = 0.0
    @objc dynamic var category : String = "" // trousers, pullovers, coats , etc.
    @objc dynamic var formalityRating : Double = 0.0

}

let UpperBodyClosetImages: [UIImage] = []
let UpperBodyClosetClasses: [Object] = []


let UpperBodyDisplayImages: [UIImage] = []


for  i in range(UpperBodyClosetClasses) {
    if UpperBodyClosetClasses.warmth <= 0.5 {
        UpperBodyDisplayImages.append(UpperBodyClosetClasses[i].image)
    }
}

