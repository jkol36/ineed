//
//  PostingJobs.swift
//  iNeed
//
//  Created by Rhonda Harmon on 6/11/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit

class PostingJobs: UIViewController {
    
    @IBOutlet weak var jobDescription: UITextView!
    @IBOutlet weak var jobDescriptionHC: NSLayoutConstraint!
    
    

    @IBOutlet weak var keyword: UITextField!
    
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDayPicker()
        createToolbar()
        
        jobDescription.text = "Ineed"
        jobDescriptionHC.constant = self.jobDescription.contentSize.height
        
    }
    
    
    func createDayPicker() {
        
        let dayPicker = UIPickerView()
        dayPicker.delegate = self
        
        favoriteDayTextField.inputView = dayPicker
        
        //Customizations
        dayPicker.backgroundColor = .white
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
}


extension PostingJobs: UIPickerViewDelegate, UIPickerViewDataSource {
    
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



