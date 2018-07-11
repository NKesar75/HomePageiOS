//
//  SetuppartonePage.swift
//  HomePage
//
//  Created by Hector Kesar on 7/11/18.
//  Copyright © 2018 HomePage. All rights reserved.
//

import UIKit
import ACFloatingTextfield_Swift

class SetuppartonePage: UIViewController {

    @IBOutlet weak var Editpencilbutton: UIButton!
    @IBOutlet weak var UserPhotoButton: UIButton!
    @IBOutlet weak var FirstNameInput: ACFloatingTextfield!
    @IBOutlet weak var LastNameInput: ACFloatingTextfield!
    @IBOutlet weak var UserNameInput: ACFloatingTextfield!
    @IBOutlet weak var EmailInput: UITextField!
    @IBOutlet weak var BioInput: UITextView!
    @IBOutlet weak var LocationInput: ACFloatingTextfield!
    @IBOutlet weak var ContactNumberInput: ACFloatingTextfield!
    @IBOutlet weak var WebsiteInput: ACFloatingTextfield!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }

    @IBAction func NextButtonPressed(_ sender: Any) {
        
    }
    
}
