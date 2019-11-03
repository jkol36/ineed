//
//  ViewController.swift
//  iNeed
//
//  Created by Dezmond Payne on 5/30/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if Auth.auth().currentUser != nil {
            present(HomeTabController(), animated: true, completion: nil)
        }
    
    }
    
    

}
