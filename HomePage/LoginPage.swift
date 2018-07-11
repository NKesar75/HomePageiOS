//
//  LoginPage.swift
//  HomePage
//
//  Created by Hector Kesar on 7/10/18.
//  Copyright © 2018 HomePage. All rights reserved.
//

import UIKit
import ACFloatingTextfield_Swift
import Firebase

class LoginPage: UIViewController {

    @IBOutlet weak var EmailInput: ACFloatingTextfield!
    @IBOutlet weak var PasswordInput: ACFloatingTextfield!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginPage.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //when enter is pressed on keyboard when email input is foucused
    @IBAction func emailtextfiledtriger(_ sender: UITextField) {
        PasswordInput.becomeFirstResponder()
    }
    
     //when enter is pressed on keyboard when password input is foucused
    @IBAction func passwordtextfielddidenter(_ sender: UITextField) {
        login()
    }
    
    @IBAction func LoginBtnPressed(_ sender: Any) {
        login()
    }
    
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func isValidateFields() -> Bool{
        
        if self.EmailInput.text?.count == 0{
            self.EmailInput.showErrorWithText(errorText: "Invaild Email")
            return false
            
        }else if self.PasswordInput.text?.count == 0 || (self.PasswordInput.text?.count)! < 8 {
            self.PasswordInput.showErrorWithText(errorText: "Invaild Password")
            return false
        }
        return true
    }
    
    func login(){
        view.endEditing(true)
        if (isValidateFields()){
                Auth.auth().signIn(withEmail: EmailInput.text!, password: PasswordInput.text!, completion: { (user, error) in
                    if let error = error {
                        AlertController.showAlert(self, title: "Error", message: error.localizedDescription)
                        print(error.localizedDescription)
                    } else {
                        let VC = HomeScreenPage()
                        self.navigationController?.pushViewController(VC, animated: true)
                    }
                })
        }
    }
    
    
    
        

}
