//
//  profileSetUP.swift
//  iNeed
//
//  Created by Rhonda Harmon on 6/24/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit
import Firebase

class profileSetUP: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    
    
    @IBOutlet weak var ProfileImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProfileImageView.layer.cornerRadius = ProfileImageView.frame.size.width / 2
        ProfileImageView.clipsToBounds = true
        ProfileImageView.layer.borderColor = UIColor.white.cgColor
        ProfileImageView.layer.borderWidth = 2
        ProfileImageView.layer.shadowColor = UIColor.gray.cgColor
        ProfileImageView.layer.shadowRadius = 6
        
        
        

        
        // Do any additional setup after loading the view.
    }
    @IBAction func TapProfileimage(_ sender: Any) {
        let picker = UIImagePickerController()
        
        
        
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info[.editedImage] as? UIImage {
            
            selectedImageFromPicker = editedImage
            self.ProfileImageView.image = selectedImageFromPicker!
            picker.dismiss(animated: true, completion: nil)
            
        } else if let orignalImage = info[.originalImage] as? UIImage {
            
            selectedImageFromPicker = orignalImage
            self.ProfileImageView.image = selectedImageFromPicker!
            picker.dismiss(animated: true, completion: nil)
        
        }
        
        
        if let selectedImage = selectedImageFromPicker { ProfileImageView.image = selectedImage
            
            guard let uid = Auth.auth().currentUser?.uid else {return}
            guard let imageData = ProfileImageView.image!.jpegData(compressionQuality: 0.75) else {return}
            let profileImgReference = Storage.storage().reference().child("profile_image_urls").child("\(uid).jpg")
            DispatchQueue.main.async {
                
            }
                profileImgReference.putData(imageData).observe(.success, handler: { (snapshot) in
                    profileImgReference.downloadURL(completion: { (url, error) in
                        if error != nil {
                            print(error!.localizedDescription)
                            return
                    
                    
                    
                    guard let uid = Auth.auth().currentUser?.uid else {return}
                    
                    let storageRef = Storage.storage().reference().child("profile_image_urls").child("\(uid).jpg")
                    
                    
                    
                        }
                        let newPostRef = Database.database().reference().child("users").child(uid)
                            if let profileImageUrl = url?.absoluteString {
                             let  ref = Database.database().reference(fromURL: "https://ineed-97442.firebaseio.com/")
                            let userReference = ref.child("users").child(uid)
                            let values = ["profileImageURL": profileImageUrl]
                                
                                userReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                                    if err != nil {
                                        print(err)
                                        return
                        
                        
                        
                        
                        
                        
                         
                      
                        //                                func downloadUrl(with url: URL) {
                        
                        //                                    let downloadTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, responce, error) in
                        //                                       if error != nil {
                        //                                            print("urlsessionerror")
                        //                                        }
                        //                                    })
                        //                                    downloadTask.resume()
                        
                    //                                    guard let uid = Auth.auth().currentUser?.uid else {return}
                       
                    }
                    //                    }
                })
               
                        //                                        func registerPicToDatabase(uid: String, values: [String:  AnyObject]) {
                        //
                        //
                    //
            }
        })
    })

        }
        
        





}
    @IBAction func profileSetUPDonee(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "SetUPComplete", sender: self)
    }
}

