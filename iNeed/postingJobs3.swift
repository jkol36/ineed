//
//  postingJobs3.swift
//  iNeed
//
//  Created by Rhonda Harmon on 7/13/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit
import Firebase

class postingJobs3: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var currencyTextField: UITextField!
    
    var amt: Int = 0
    var posting: JobPosting?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createToolbar()
        
        currencyTextField.delegate = self
        currencyTextField.placeholder = updateAmount()

        // Do any additional setup after loading the view.
    }
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
     
        
        if let digit = Int(string) {
            amt = amt * 10 + digit
            currencyTextField.text = updateAmount()
    }
        if string == "" {
            amt = amt/10
            currencyTextField.text = updateAmount()
        }
        return false
    
}
    func updateAmount() -> String? {
        let Formatter = NumberFormatter()
        Formatter.numberStyle = NumberFormatter.Style.currency
        let amount = Double(amt/100) + Double(amt%100)/100
        return Formatter.string(from: NSNumber(value: amount))
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
        

    

}
    func createToolbar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Customizations
        toolBar.barTintColor = .gray
        toolBar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(PostingJobs.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        currencyTextField.inputAccessoryView = toolBar
}
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @IBAction func nextFinal(_ sender: Any) {
        
        self.posting?.price = currencyTextField.text
        
        let  ref = Database.database().reference(fromURL: "https://ineed-97442.firebaseio.com/")
        let postingReference = ref.child("jobPostings")
        let values = self.posting?.values()
        postingReference.childByAutoId().setValue(values) {(error, ref) in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    

    
    
}
