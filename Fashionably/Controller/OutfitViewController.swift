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
    
    
    @IBOutlet weak var image3: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadClothes()
        photoCircle(image: image3!)

    }
    
    func photoCircle(image: UIImageView){
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
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



func filter1(ranger: Array<Clothing>, storer: Array<UIImage>, x:  int){
    for  i in range(ranger) {
        if ranger.formality <= 0.5 {
            storer.append(ranger[i].image)
        }
    }
    
}

//Creating a list  of UpperBodyImages to display
//let UpperBodyClosetClasses: [Object] = []

let UpperBodyImagesV1: [UIImage] = []

filter1(UpperBodyClosetClasses, UpperBodyImagesV1, 0.5)

//Creating a list of LowerBodyImages to display
//let LowerBodyClosetClasses: [Object] = []


let LowerBodyImagesV1: [UIImage] = []

filter1(LowerBodyClosetClasses, LowerBodyImagesV1, 0.5)

//Creating a list  of OuterWearImages to display
//let OuterWearClosetClasses: [Object] = []

let OuterWearImagesV1: [UIImage] = []
filter1(OuterWearClosetClasses, OuterWearImagesV1, 0.5)


//Creating a list  of ShoesImages to display
//let ShoesClosetClasses: [Object] = []

let ShoesImagesV1: [UIImage] = []
filter1(ShoesClosetClasses, ShoesImagesV1, 0.5)


