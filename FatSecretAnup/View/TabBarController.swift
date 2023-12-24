//
//  TabBarControllerViewController.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 20/12/2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    let viewModel = TabBarViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getTabBarItems()
        setUpTabBar()
    }
    
//  MARK: - Setting up Tab Bar
    
    private func setUpTabBar(){
         
        // Adding TabBar items
        viewModel.addTabBarItems()
        
        // Adding Avatar Image/System Image to Me TabItem
        viewModel.addAvatar()

        // Setting up ViewControllers for the TabBar
        self.viewControllers = viewModel.tabBarViewControllers
        
        // TabBar background color, border and colour settings
        self.tabBar.backgroundColor = .systemGray6
        self.tabBar.tintColor = fatSecretGreen
        self.tabBar.layer.borderWidth = 0.18
        self.tabBar.layer.borderColor = tabBarGray.cgColor
        self.selectedIndex = 2
    }
  
}
