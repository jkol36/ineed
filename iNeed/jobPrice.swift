//
//  jobPrice.swift
//  iNeed
//
//  Created by Rhonda Harmon on 6/21/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit

class jobPrice: UIViewController {
    
    @IBOutlet weak var lbl: UILabel!
    
    @IBAction func Slider(_ sender: UISlider) {
        
        lbl.text = String(Int(sender.value))
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
