//
//  CheckBox.swift
//  iNeed
//
//  Created by Rhonda Harmon on 6/13/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit

class CheckBox: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        class CheckBox: UIButton {
            // Images
            let checkedImage = UIImage(named: "ic_check_box")! as UIImage
            let uncheckedImage = UIImage(named: "ic_check_box_outline_blank")! as UIImage
            
            // Bool property
            var isChecked: Bool = false {
                didSet{
                    if isChecked == true {
                        self.setImage(checkedImage, for: UIControl.State.normal)
                    } else {
                        self.setImage(uncheckedImage, for: UIControl.State.normal)
                    }
                }
            }
            
            override func awakeFromNib() {
                self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
                self.isChecked = false
            }
            
            @objc func buttonClicked(sender: UIButton) {
                if sender == self {
                    isChecked = !isChecked
                }
            }
        }
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
