//
//  TypicalNeedsCell.swift
//  iNeed
//
//  Created by Bernie Cartin on 8/19/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit

class TypicalNeedsCell: UICollectionViewCell {
    
    let button: UIButton = {
        let button = UIButton(backgroundColor: .gray)
        button.layer.cornerRadius = 10
        button.setSizeAnchors(height: 88, width: 88)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        addSubview(button)
        button.fillSuperview()
        
    }
}
