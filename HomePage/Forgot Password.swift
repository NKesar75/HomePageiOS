//
//  Forgot Password.swift
//  HomePage
//
//  Created by Hector Kesar on 7/11/18.
//  Copyright © 2018 HomePage. All rights reserved.
//

import UIKit
import Firebase
import ACFloatingTextfield_Swift

class Forgot_Password: UIViewController {

    @IBOutlet weak var EmailInput: ACFloatingTextfield!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Forgot_Password.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func SendEmail(_ sender: Any) {
        if (EmailInput.text?.count)! > 0  && EmailInput.text != " " {
            Auth.auth().sendPasswordReset(withEmail: EmailInput.text!) { (error) in
                if let error = error {
                    AlertController.showAlert(self, title: "Error", message: error.localizedDescription)
                    print(error.localizedDescription)
                } else {
                    let VC = LoginPage()
                    self.navigationController?.pushViewController(VC, animated: true)
                }
            }
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}
