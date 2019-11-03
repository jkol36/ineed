//
//  DetailsController.swift
//  iNeed
//
//  Created by Bernie Cartin on 8/6/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
    
    var posting: JobPosting? {
        didSet {
            loadPosting()
        }
    }
    
    let addressLabel = UILabel()
    let descriptionLabel = UILabel()
    let categoryLabel = UILabel()
    let priceLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        
        view.backgroundColor = .white
        
        addressLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        categoryLabel.numberOfLines = 0
        priceLabel.numberOfLines = 0
        
        let stack = UIStackView(arrangedSubviews: [addressLabel, descriptionLabel, categoryLabel, priceLabel])
        stack.axis = .vertical
        stack.spacing = 12
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.widthAnchor.constraint(equalToConstant: view.frame.width - 24).isActive = true
        stack.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0).isActive = true
        stack.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 0).isActive = true
    }
    
    fileprivate func loadPosting() {
        if let posting = posting {
            addressLabel.text = "Address: \(posting.address)"
            descriptionLabel.text = "Description: \(posting.description)"
            categoryLabel.text = "Category: \(posting.category ?? "")"
            priceLabel.text = "Price: \(posting.price ?? "")"
        }
    }
}


