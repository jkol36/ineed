//
//  TrendingNeedCell.swift
//  iNeed
//
//  Created by Bernie Cartin on 8/19/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit

class TrendingNeedsCell: UICollectionViewCell {
    
    let button: UIButton = {
        let button = UIButton(backgroundColor: .white)
        button.layer.cornerRadius = 16
        button.setSizeAnchors(height: 32, width: 72)
        button.setTitle("Name", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
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
        button.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 4, right: 0))
        
    }
}
