//
//  ViewController.swift
//  Fashionably
//
//  Created by Rikin Patel on 2019-01-13.
//  Copyright © 2019 Hrithvik  Alex. All rights reserved.
//
//
//import UIKit
//
//class StyleViewController: UIViewController {
//
//
//    var formal: int = 0
//    var casual: int = 0
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    @IBAction func buttonTapped(button: NSButton)
//    {
//        print("hello")
//    }
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var strLabel: NSTextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    override var representedObjecrt: AnyObject? {
        didSet{
        
        }
    }
    
    @IBAction func printHello (sender: AnyObject) {
        strLabel.stringValue = "Hello"
    }


    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
