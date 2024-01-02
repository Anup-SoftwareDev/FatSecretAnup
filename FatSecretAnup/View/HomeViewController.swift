//
//  HomeViewController.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 21/12/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeDetailsView = UIView()
    let navBarTop = UIView()
    let navigationBar = UINavigationBar()
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpHomeDetailsView()
    }
    
    private func setUpNavigationBar(){
        viewModel.setUpNavigationBar(view: view, navigationBar: navigationBar)
        viewModel.setUpNavBarTop(navBarTop: navBarTop, view: view, navigationBar: navigationBar)
    }
    private func setUpHomeDetailsView(){
        
        self.view.addSubview(homeDetailsView)
        homeDetailsView.backgroundColor = .systemCyan
        
        // Setup Constraints for HomeDetailsView
        setUpDetailsViewConstraintsNav(detailsView: homeDetailsView, parentView: view, navigationBar: navigationBar)
        
    }
}
