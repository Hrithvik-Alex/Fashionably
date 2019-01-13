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
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadClothes()
        firstImage.image = "sweater-2.jpg"
        secondImage.image = "sweater-2.jpg"
        thirdImage.image = "sweater-2.jpg"
        fourthImage.image = "sweater-2.jpg"

    }
    
    
    
    
    func loadClothes() {
        clothes = realm.objects(Clothing.self)
    }
    
    @IBAction func firstRightPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func firstLeftPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func secondRightPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func secondLeftPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func thirdRightPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func thirdLeftPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func fourthRightPressed(_ sender: UIButton) {
        
    }
    
    
    @IBAction func fourthLeftPressed(_ sender: UIButton) {
        
    }
}

let UpperBodyBusiness: [UIImage] = []

let LowerBodyBusiness: [UIImage] = []

let OuterWearBusiness: [UIImage]  = []

let ShoesBusiness: [UIImage] = []

let UpperBodyCasual: [UIImage]  =  []

let LowerBodyCasual:  [UIImage] =  []

let OuterWearCasual: [UIImage]  = []

let ShoesCasual: [UIImage] = []


