//
//  HomeController.swift
//  iNeed
//
//  Created by Bernie Cartin on 8/19/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    var collectionViewArray = [Any]()
    
    let defaultCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 32), collectionViewLayout: UICollectionViewFlowLayout())
        cv.register(HomeHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        cv.register(TrendingNeedsCell.self, forCellWithReuseIdentifier: "Cell")
        cv.backgroundColor = .white
        return cv
    }()
    
    let logo = UIImageView(image: #imageLiteral(resourceName: "iNeed"))
    
    let addView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 20
        return view
    }()
    
    let needButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "iNeed button"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupDelegates()
        defaultCollectionView.reloadData()
    }
    
    fileprivate func setupUI() {
        view.backgroundColor = .white
        let safeArea = view.safeAreaLayoutGuide
        
        logo.setSizeAnchors(height: 44, width: 112)
        navigationItem.titleView = logo
        
        view.addSubview(defaultCollectionView)
        defaultCollectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        defaultCollectionView.setSizeAnchors(height: 208, width: nil)
        
        view.addSubview(addView)
        addView.centerHorizontaly(offset: 0)
        addView.anchorTop(anchor: defaultCollectionView.bottomAnchor, paddingTop: 24)
        addView.setSizeAnchors(height: 200, width: view.frame.width - 88)
        
        let addLabel = UILabel()
        addLabel.text = "Whatever you need\n Done\n Fast! Efficiently\n With push of one button"
        addLabel.textAlignment = .center
        addLabel.numberOfLines = 0
        addLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        addView.addSubview(addLabel)
        addLabel.anchor(top: addView.topAnchor, leading: addView.leadingAnchor, bottom: addView.bottomAnchor, trailing: addView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
        let postLabel = UILabel()
        postLabel.text = "Post a Custom Need!"
        postLabel.textAlignment = .center
        postLabel.font = UIFont.boldSystemFont(ofSize: 32)
        
        view.addSubview(postLabel)
        postLabel.centerHorizontaly(offset: 0)
        postLabel.anchorTop(anchor: addView.bottomAnchor, paddingTop: 24)
        
        view.addSubview(needButton)
        needButton.centerHorizontaly(offset: 0)
        needButton.anchorTop(anchor: postLabel.bottomAnchor, paddingTop: 24)
        
        
    }
    
    fileprivate func setupDelegates(){
        defaultCollectionView.delegate = self
        defaultCollectionView.dataSource = self
    }
    
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = defaultCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TrendingNeedsCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! HomeHeaderView
//        headerController = header.groupMembersView as GroupMembersController
        return header
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 168)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 72, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
