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
    @IBOutlet weak var secondImage: UIImageView!
    
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var fourthImage: UIImageView!
    
    
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
        
        
        
    }
    
    
    @IBAction func leftButton1(_ sender: UIButton) {
        i-=1
        firstImage.image = casual_images_top[i]
    }
    
    @IBAction func leftButton2(_ sender: Any) {
        i+=1
        secondImage.image =  casual_images_pants[i]
    }
    
    
    @IBAction func rightButton2(_ sender: Any) {
        i-=1
        secondImage.image =  casual_images_pants[i]
    }
    
    
    @IBAction func leftButton3(_ sender: Any) {
        i+=1
        thirdImage.image =  casual_images_shoes[i]
    }
    
    @IBAction func rightButton3(_ sender: Any) {
        i-=1
        thirdImage.image =  casual_images_shoes[i]
    }
    
    
    @IBAction func leftButton4(_ sender: Any) {
        i+=1
        fourthImage.image =  casual_images_outer[i]
    }
    
    
    @IBAction func rightButton4(_ sender: Any) {
        i-=1
        fourthImage.image =  casual_images_outer[i]
    }
    
}


