//
//  postingJobs2.swift
//  iNeed
//
//  Created by Rhonda Harmon on 7/13/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit
import Firebase

class postingJobs2: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var keyword: UITextField!
    @IBOutlet weak var toolsNeeded: UITextField!
    @IBOutlet weak var hourYN: UITextField!
    @IBOutlet weak var favoriteDayTextField: UITextField!
    
    let days = ["Errand",
                "House Needs",
                "Car Needs",
                "Rides",
                "Disabilty Assist",
                "School Help",
                "Animal Help",
                "Photagraphy",
                "Other"]
    
    var selectedDay: String?
    
    var posting: JobPosting?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDayPicker()
        createToolbar()
        
        self.keyword.delegate = self
        self.toolsNeeded.delegate = self
        self.hourYN.delegate = self
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    func createDayPicker() {
        
        let dayPicker = UIPickerView()
        dayPicker.backgroundColor = .white
        dayPicker.delegate = self
        
        favoriteDayTextField.inputView = dayPicker
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
        
        favoriteDayTextField.inputAccessoryView = toolBar
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? postingJobs3 {
            vc.posting = self.posting
        }
    }
    
    
    @IBAction func next2(_ sender: Any) {
        
        self.posting?.keyword = keyword.text
        self.posting?.toolsNeeded = toolsNeeded.text
        self.posting?.hour = hourYN.text
        self.posting?.category = favoriteDayTextField.text
        
        self.performSegue(withIdentifier: "jobNext2", sender: self)
        
//        guard  let uid = Auth.auth().currentUser?.uid else {
//            return
//        }
        
//        let  ref = Database.database().reference(fromURL: "https://ineed-97442.firebaseio.com/")
//        let userReference = ref.child("users").child(uid).child("jobPostings")
//
//        let values = ["keyword":self.keyword.text!,"toolsNeeded" : self.toolsNeeded.text!, "hour" : self.hourYN.text!, "catagory" : self.favoriteDayTextField.text!]
//        userReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
//            if err != nil {
//                print(err)
//                return
//
//
//            }
//
//
//        })
    }
}


extension postingJobs2: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return days[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedDay = days[row]
        favoriteDayTextField.text = selectedDay
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .blue
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 17)
        
        label.text = days[row]
        
        return label
    }
    
}
