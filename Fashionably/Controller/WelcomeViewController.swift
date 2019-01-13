//
//  WelcomeViewController.swift
//  Fashionably
//
//  Created by Hrithvik  Alex on 2019-01-13.
//  Copyright © 2019 Hrithvik  Alex. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "SignIn", sender: self)
    }
    
    
}
