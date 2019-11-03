//
//  profileAlreadySetUP.swift
//  iNeed
//
//  Created by Rhonda Harmon on 6/27/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import CoreLocation
import FirebaseAuth









class profileAlreadySetUP: UIViewController {
    
    
    
    
    @IBOutlet weak var profileImageViewSetup: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageViewSetup.layer.cornerRadius = profileImageViewSetup.frame.size.width / 2
        profileImageViewSetup.clipsToBounds = true
        profileImageViewSetup.layer.borderColor = UIColor.white.cgColor
        profileImageViewSetup.layer.borderWidth = 2
        profileImageViewSetup.layer.shadowColor = UIColor.gray.cgColor
        profileImageViewSetup.layer.shadowRadius = 6
        
        let uid = Auth.auth().currentUser?.uid
        
         Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
        
        if let dictionary = snapshot.value as? [String: AnyObject] {
            self.NameLabel.text = dictionary["name"] as? String
        
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let profileImgReference = Storage.storage().reference().child("profile_image_urls").child("\(uid).jpg")
            DispatchQueue.main.async {
                
            }
        
        let downloadtask = profileImgReference.getData(maxSize: 1024 * 1024 * 12) { (data, error) in
            if let data = data {
                let image = UIImage(data: data)
                self.profileImageViewSetup.image = image
            }
            print(error ?? "no error")
        }
        downloadtask.resume()
    }
    
})


    



    


    
        
        


    
   
    




}

}
