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
    
    
    let imagePicker = UIImagePickerController()
    
    let realm = try! Realm()
    
    let types = ["T-shirt", "trouser", "dress", "coat", "sandal", "shirt", "sneaker", "boot", "shoes", "pants", "sweater", "jacket", "shorts"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
    }
    
    //Image picker methods
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {


            if let userPickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                guard let ciImage = CIImage(image: userPickedImage)else {
                    fatalError("could not convert")
                }

                detect(image: ciImage)
            }

            imagePicker.dismiss(animated: true, completion: nil)
        }

        func detect(image: CIImage){

            guard let model = try? VNCoreMLModel(for: VGG16().model) else {
                fatalError("cannot import")
            }

            let request = VNCoreMLRequest(model: model) { (request, error) in
                guard let results = request.results as? [VNClassificationObservation] else {
                    fatalError("error processing image")
                }
                
                 let mainResults = results[0...4]
                for results in mainResults {
                    if self.types.contains(results.identifier){
                        let newClothing = Clothing()
                        newClothing.type = results.identifier
                        newClothing.warmthRating = self.setWarmthRating(type: newClothing.type)
                        newClothing.formalityRating = self.setFormalRating(type: newClothing.type)
                        do {
                            try self.realm.write {
                                self.realm.add(newClothing)
                            }
                        }catch {
                            print("Error saving clothing \(error)")
                        }
                    }
                }
//                    if mainResults.contains("hotdog") {
//                        self.navigationItem.title = "Hotdog!"
//                    } else {
//                        self.navigationItem.title = "Not Hotdog!"
//                    }
                
            }

            let handler = VNImageRequestHandler(ciImage: image)

            do {
                try handler.perform([request])
            } catch {
                print(error)
            }
        }
    
    func setWarmthRating(type: String) -> Double {
        let warmthValues : [String:Double] = [
            "T-shirt" : 0.15,
            "trouser": 0.5,
            "dress": 0.15,
            "coat": 0.50,
            "sandal": 0.10,
            "shirt": 0.20,
            "sneaker": 0.50,
            "boot": 1.00,
            "shoe": 0.4,
            "pants": 0.45,
            "jeans": 0.5,
            "sweater": 0.45,
            "shorts": 0.3
        ]
        
        return warmthValues[type]!
    }
    
    func setFormalRating(type: String) -> Double {
        let formalValues : [String:Double] = [
            "T-shirt" : 0.2,
            "trouser": 0.8,
            "dress": 0.8,
            "coat": 0.5,
            "sandal": 0.2,
            "shirt": 0.6,
            "sneaker": 0.4,
            "boot": 1.00,
            "shoe": 0.4,
            "pants": 0.45,
            "jeans": 0.4,
            "sweater": 0.2,
            "shorts": 0.2
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
            "boot": "footwear",
            "shoe": "footwear",
            "pants": "lower",
            "jeans": "lower",
            "sweater": "upper",
            "shorts": "lower"
        ]
        return categories[type]!
    }
    

    @IBAction func addClothingButtonPressed(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    

}
