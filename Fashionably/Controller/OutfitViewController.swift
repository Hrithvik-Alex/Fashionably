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
    
    
}



