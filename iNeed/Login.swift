//
//  Login.swift
//  iNeed
//
//  Created by Rhonda Harmon on 6/22/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit
import FirebaseAuth

class Login: UIViewController, UITextFieldDelegate   {
    
    @IBOutlet weak var UserEmail: UITextField!
    @IBOutlet weak var UserPassword: UITextField!
    


    override func viewDidLoad() {
        print("view loaded")
        super.viewDidLoad()
        
        
        self.UserEmail.delegate = self
        self.UserPassword.delegate = self
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
        // Do any additional setup after loading the view.
        
     
    }
    
    
    @IBAction func SignIn(_ sender: UIButton)
    {
        Auth.auth().signIn(withEmail: UserEmail.text!, password: UserPassword.text!) { [weak self](user, error) in
            if user != nil
            {
//                self.performSegue(withIdentifier: "NavController", sender: self)
                self?.present(HomeTabController(), animated: true, completion: nil)
                
        }
            else
            {
                let alert = UIAlertController(title: "There was a Problem", message: nil, preferredStyle: .alert)
                let okbutton = UIAlertAction(title: "ok", style: .default, handler: nil)
                alert.addAction(okbutton)
                self?.present(alert, animated: true, completion: nil)
                 
                
            }
            
            }
    }
        
    
    
}



