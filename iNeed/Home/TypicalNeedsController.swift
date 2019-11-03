//
//  TypicalNeedsController.swift
//  iNeed
//
//  Created by Bernie Cartin on 8/19/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//

import UIKit

class TypicalNeedsController: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 88), collectionViewLayout: layout)
        cv.register(TypicalNeedsCell.self, forCellWithReuseIdentifier: "Cell")
        cv.backgroundColor = .white
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupDelegates()
        collectionView.reloadData()
    }
    
    fileprivate func setupUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    fileprivate func setupDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }


}

extension TypicalNeedsController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TypicalNeedsCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 88, height: 88)
    }
    
    
}
