//
//  SignUpPage.swift
//  HomePage
//
//  Created by Hector Kesar on 7/10/18.
//  Copyright © 2018 HomePage. All rights reserved.
//

import UIKit
import ACFloatingTextfield_Swift
import Firebase

class SignUpPage: UIViewController {

    @IBOutlet weak var EmailInput: ACFloatingTextfield!
    @IBOutlet weak var PasswordInput: ACFloatingTextfield!
    @IBOutlet weak var ReinputPassword: ACFloatingTextfield!
    @IBOutlet weak var AgreeCheckBox: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        //set navagation bar to black
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "BackImg"), for: UIBarMetrics.default)
    }
    
    
    @IBAction func SignUpBtnPressed(_ sender: Any) {
        SignUp()
    }
    
    @IBAction func EmailBtnEnter(_ sender: Any) {
        self.PasswordInput.becomeFirstResponder()
    }
    
    
    @IBAction func PasswordBtnEnter(_ sender: Any) {
        self.ReinputPassword.becomeFirstResponder()
    }
    
    @IBAction func RePasswordBtnEnter(_ sender: Any) {
        SignUp()
    }
    
    @IBAction func btnChkBoxPressed(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            sender.setImage(UIImage(named: "chkbox_chked"), for: .normal)
        }else{
            sender.setImage(UIImage(named: "chkbox_unchkd"), for: .normal)
        }
        
    }
    
    func isValidateFields() -> Bool{
        
        if self.EmailInput.text?.count == 0{
            self.EmailInput.showErrorWithText(errorText: "Invaild Email")
            return false
        }else if self.PasswordInput.text?.count == 0 || (self.PasswordInput.text?.count)! < 8 {
            self.PasswordInput.showErrorWithText(errorText: "Invaild Password must be atleast 8 characters long")
            return false
        }else if ReinputPassword.text?.count == 0 || (self.ReinputPassword.text?.count)! < 8 {
            self.ReinputPassword.showErrorWithText(errorText: "Invaild Password must be atleast 8 characters long")
            return false
        }else if ReinputPassword.text != PasswordInput.text{
            self.PasswordInput.showErrorWithText(errorText: "Passwords do not match")
            return false
        }else if AgreeCheckBox.isSelected != true  {
            return false
        }
        return true
    }
    
    func SignUp(){
        view.endEditing(true)
        if (isValidateFields()){
            Auth.auth().signIn(withEmail: EmailInput.text!, password: PasswordInput.text!, completion: { (user, error) in
                if let error = error {
                    AlertController.showAlert(self, title: "Error", message: error.localizedDescription)
                } else {
                    let VC = SetuppartonePage()
                    self.navigationController?.pushViewController(VC, animated: true)
                }
            })
        }
    }
    
}
