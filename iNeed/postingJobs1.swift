//
//  postingJobs1.swift
//  iNeed
//
//  Created by Rhonda Harmon on 7/12/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation

class postingJobs1: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var posting: JobPosting?
    
    
    @IBOutlet weak var jobLocation: UITextField!
    
    @IBOutlet weak var jobDescription: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createToolbar()
        self.jobDescription.layer.borderColor = UIColor.blue.cgColor
        self.jobDescription.layer.borderWidth = 1.0;
        self.jobDescription.layer.cornerRadius = 8;
        self.jobDescription.text = "                                                                                                                                                                        "
        self.jobLocation.delegate = self
        self.jobDescription.delegate = self
        

        // Do any additional setup after loading the view.
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
        
        jobDescription.inputAccessoryView = toolBar
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? postingJobs2 {
            vc.posting = self.posting
        }
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        guard  let uid = Auth.auth().currentUser?.uid else {return}
        if let address = jobLocation.text, jobLocation.text?.count ?? 0 > 0 {
            getCoordinate(from: address) { [weak self](coordinate, error) in
                if let err = error {
                    print(err.localizedDescription)
                    return
                }
                if let coordinate = coordinate {
                    let posting = JobPosting(postingUser: uid, address: address, description: self?.jobDescription.text ?? "", coordinate: coordinate)
                    self?.posting = posting
                    self?.performSegue(withIdentifier: "jobNext1", sender: self)
                }
            }
        }
        

    }
    
    func getCoordinate(from address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(address) { completion($0?.first?.location?.coordinate, $1) }
    }
}


