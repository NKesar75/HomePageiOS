//
//  InitalPage.swift
//  HomePage
//
//  Created by Hector Kesar on 7/10/18.
//  Copyright © 2018 HomePage. All rights reserved.
//

import UIKit
import Firebase

class InitalPage: UIViewController {

    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var SplitLine: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

        //Puts the navigation Bar back up when leaving this page
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }
    
    //Gets Rid of Nav Bar at the Top
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    
        //set the login and sign up button
        self.LoginBtn.frame = CGRect(x: 0, y: self.view.frame.maxY - 50, width: (self.view.frame.maxX / 2) - 1, height: 50)
        self.SplitLine.frame = CGRect(x: self.LoginBtn.frame.maxX, y: self.LoginBtn.frame.minY, width: 2, height: 50)
        self.SignUpButton.frame = CGRect(x: self.SplitLine.frame.maxX, y: self.SplitLine.frame.minY, width: (self.view.frame.maxX / 2) - 1, height: 50)
        
        //if didnt log out in previous in already auto signs in
        if Auth.auth().currentUser != nil {
            let VC = HomeScreenPage()
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    

}
