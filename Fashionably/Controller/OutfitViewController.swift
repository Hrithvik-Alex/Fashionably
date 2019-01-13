//
//  OutfitViewController.swift
//  Fashionably
//
//  Created by Hrithvik  Alex on 2019-01-13.
//  Copyright © 2019 Hrithvik  Alex. All rights reserved.
//

import UIKit
import RealmSwift

class OutfitViewController: UIViewController {

    let realm = try! Realm()
    
    var clothes : Results<Clothing>!
    
    @IBOutlet weak var firstImage: UIImageView!
    
    var casual_images_shoes: [UIImages] = ["CasualShoes1.jpg", "CasualShoes3.jpg", "CasualShoes3.jpg"]
    
    var casual_images_pants: [UIImages] = ["LowerBodyCasual1.jpg", "LowerBodyCasual2.jpg", "LowerBodyCasual3.jpg"]
    
    var casual_images_outer: [UIImages] = ["OuterWearCasual1.jpg"]
    
     var casual_images_top: [UIImages] = ["UpperWear1.jpg, UpperWear2.jpg"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadClothes()
        firstImage.image = casual_images_top[0]
        secondImage.image =  casual_images_pants[0]
        thirdImage.image =  casual_images_shoes[0]
        fourthImage.image =  casual_images_outer[0]
    }
    
    
    func loadClothes() {
        clothes = realm.objects(Clothing.self)
    }
    
    var i = 0
    @IBAction func firstRightPressed(_ sender: UIButton) {
        i+=1
        firstImage.image = casual_images_top[i]
        secondImage.image =  casual_images_pants[i]
        thirdImage.image =  casual_images_shoes[i]
        fourthImage.image =  casual_images_outer[i]
    }
    
    
}



