//
//  VerfiyEmailPage.swift
//  HomePage
//
//  Created by Hector Kesar on 7/11/18.
//  Copyright © 2018 HomePage. All rights reserved.
//

import UIKit
import Firebase

class VerfiyEmailPage: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        //set navagation bar to black
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "BackImg"), for: UIBarMetrics.default)
    }
    
    @IBAction func VerfityEmailBtnPressed(_ sender: Any) {
        if let user = Auth.auth().currentUser {
            if user.isEmailVerified{
                let VC = VerfiyEmailPage()
                self.navigationController?.pushViewController(VC, animated: true)
            }else {
            AlertController.showAlert(self, title: "Email", message: "Please Verify Email to Continue")
            }
        }
    }
    
    @IBAction func  ReSendEmailBtnPressed(_ sender: Any){
        
        Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
            if error != nil{
                AlertController.showAlert(self, title: "Error", message: "Error Connecting to Server Please Try Again")
            }else{
                AlertController.showAlert(self, title: "Email Sent", message: "Please Check Your Email")
            }
        })
    }
    
    
    
}
