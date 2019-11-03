//
//  HomeTabController.swift
//  iNeed
//
//  Created by Bernie Cartin on 8/19/19.
//  Copyright © 2019 Chcek Mate TV. All rights reserved.
//
import UIKit

class HomeTabController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setUpViewControllers()
    }
    
    //MARK: - Init
    
    fileprivate func setupUI() {
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        
    }
    
    func setUpViewControllers() {
        self.delegate = self
        view.backgroundColor = .white
        
        
        let homeController = templateNavController(title: "Home", unselectedImage: #imageLiteral(resourceName: "user"), selectedImage: #imageLiteral(resourceName: "user"), rootViewController: HomeController())        
        
        let mapController = templateNavController(title: "Map", unselectedImage: #imageLiteral(resourceName: "user"), selectedImage: #imageLiteral(resourceName: "user"))
        
        let searchController = templateNavController(title: "Search", unselectedImage: #imageLiteral(resourceName: "user"), selectedImage: #imageLiteral(resourceName: "user"))
        
        let accountController = templateNavController(title: "Account", unselectedImage: #imageLiteral(resourceName: "user"), selectedImage: #imageLiteral(resourceName: "user"))
        
        
        
        viewControllers = [homeController, mapController, searchController, accountController]
        //modify tab bar item insets
        guard let items = tabBar.items else {return}
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
        tabBar.tintColor = .black
    }
    
    
    
    fileprivate func templateNavController(title: String?, unselectedImage: UIImage, selectedImage:UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let viewController = rootViewController
        let navController = UINavigationController(rootViewController: viewController)
        if let title = title {
            navController.tabBarItem.title = title
        }
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        navController.navigationBar.isTranslucent = false
        navController.navigationBar.tintColor = UIColor.black
        navController.navigationBar.barTintColor = UIColor(white: 0.95, alpha: 1)
        return navController
    }
    
    //MARK: - Handlers
    
    
    
}

