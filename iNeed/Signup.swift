//
//  Signup.swift
//  iNeed
//
//  Created by Rhonda Harmon on 6/22/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class Signup: UIViewController {
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var DOB: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    
     var ref: DatabaseReference!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignUP(_ sender: UIButton)
    {
        
        
        Auth.auth().createUser(withEmail: Email.text!, password: Password.text!) { (User, Error) in
            if User != nil
                
            {
                print("User Created")
                self.performSegue(withIdentifier: "SignUpDone", sender: self)
            }
            else
            {
                let alert = UIAlertController(title: "Sign UP Error", message: nil, preferredStyle: .alert)
                let okbutton = UIAlertAction(title: "ok", style: .default, handler: nil)
                alert.addAction(okbutton)
                self.present(alert, animated: true, completion: nil)
                
            }
            guard  let uid = Auth.auth().currentUser?.uid else {
                return
            }
    
        let  ref = Database.database().reference(fromURL: "https://ineed-97442.firebaseio.com/")
        let userReference = ref.child("users").child(uid)
        
            let values = ["name":self.Name.text!,"DOB" : self.DOB.text!]
        userReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            if err != nil {
                print(err)
                return
                
            }
                
        })

    }

    }
}
