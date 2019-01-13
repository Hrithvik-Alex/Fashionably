//
//  MenuViewController.swift
//  Fashionably
//
//  Created by Hrithvik  Alex on 2019-01-13.
//  Copyright © 2019 Hrithvik  Alex. All rights reserved.
//

import UIKit
import CoreML
import Vision
import RealmSwift

class MenuViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
//     let imagePicker = UIImagePickerController()
    
    let realm = try! Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//                imagePicker.delegate = self
//                imagePicker.allowsEditing = false
//                imagePicker.sourceType = .camera
    }
    
    //Image picker methods
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//
//
//            if let userPickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//                guard let ciImage = CIImage(image: userPickedImage)else {
//                    fatalError("could not convert")
//                }
//
//                detect(image: ciImage)
//                ImageView.image = userPickedImage
//            }
//
//            imagePicker.dismiss(animated: true, completion: nil)
//        }
//
//        func detect(image: CIImage){
//
//            guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
//                fatalError("cannot import")
//            }
//
//            let request = VNCoreMLRequest(model: model) { (request, error) in
//                guard let classification = request.results?.first as? VNClassificationObservation else {
//                    fatalError("No flower found")
//                }
//
//                self.navigationItem.title = classification.identifier.capitalized
//                self.requestInfo(flowerType: classification.identifier)
//
//            }
//
//            let handler = VNImageRequestHandler(ciImage: image)
//
//            do {
//                try handler.perform([request])
//            } catch {
//                print(error)
//            }
//        }
    
    func setWarmthRating(type: String) -> Double {
        let warmthValues : [String:Double] = [
            "T-Shirt" : 0.15,
            "Trouser": 0.25,
            "Pullover": 0.35,
            "Dress": 0.15,
            "Coat": 0.50,
            "Sandal": 0.10,
            "Shirt": 0.20,
            "Sneaker": 0.50,
            "Bag": 0.00,
            "Ankle Boot": 1.00
        ]
        
        return warmthValues[type]!
    }
    
    func setFormalRating(type: String) -> Double {
        let formalValues : [String:Double] = [
            "T-Shirt" : 0.2,
            "Trouser": 0.8,
            "Pullover": 0.2,
            "Dress": 0.8,
            "Coat": 0.5,
            "Sandal": 0.2,
            "Shirt": 0.6,
            "Sneaker": 0.8,
            "Bag": 0.9,
            "Ankle Boot": 0.5
        ]
        
        return formalValues[type]!
    }
    
    func setCategory(type: String) -> String {
        let categories : [String:String] = [
            "T-Shirt" : "upper",
            "Trouser": "lower",
            "Pullover": "outer",
            "Dress": "upper",
            "Coat": "outer",
            "Sandal": "footwear",
            "Shirt": "upper",
            "Sneaker": "footwear",
            "Bag": "other",
            "Ankle Boot": "footwear"
        ]
        return categories[type]!
    }
    
    
    @IBAction func addClothingPressed(_ sender: UIButton) {
        let newClothing = Clothing()
        newClothing.type = getClothingType()
        newClothing.warmthRating = setWarmthRating(type: newClothing.type)
        newClothing.formalityRating = setFormalRating(type: newClothing.type)
        do {
            try realm.write {
                realm.add(newClothing)
            }
        }catch {
                print("Error saving clothing \(error)")
            }
        
    }
    
    
    func getClothingType() -> String {
        return "Heh"
    }
    

}
