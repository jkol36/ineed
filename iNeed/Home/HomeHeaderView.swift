//
//  HomeHeaderView.swift
//  iNeed
//
//  Created by Bernie Cartin on 8/19/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit

class HomeHeaderView: UICollectionReusableView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Typical Needs"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Trending Needs"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()

    let typicalNeedsController = TypicalNeedsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        backgroundColor = .white
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16))
        titleLabel.setSizeAnchors(height: 24, width: nil)
        
        addSubview(subTitleLabel)
        subTitleLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 8, right: 16))
        subTitleLabel.setSizeAnchors(height: 24, width: nil)
        
        addSubview(typicalNeedsController.view)
        typicalNeedsController.view.setSizeAnchors(height: 88, width: nil)
        typicalNeedsController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: subTitleLabel.topAnchor, trailing: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 8, right: 0))
        
        
    }
}
