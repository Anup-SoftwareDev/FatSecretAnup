//
//  MeViewController.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 21/12/2023.
//

import UIKit

class MeViewController: UIViewController {
    
    let meDetailsView = UIView()
    let navBarTop = UIView()
    let segueButton = UIButton()
    let navigationBar = UINavigationBar()
    let viewModel = MeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpMeDetailsView()
    }
    
    private func setUpNavigationBar(){
        viewModel.setUpNavigationBar(view: view, navigationBar: navigationBar)
        viewModel.setUpNavBarTop(navBarTop: navBarTop, view: view, navigationBar: navigationBar)
    }
    
    private func setUpMeDetailsView(){
        self.view.addSubview(meDetailsView)
        meDetailsView.backgroundColor = .orange
        
        // Setup Constraints for meDetailsView
        
        setUpDetailsViewConstraintsNav(detailsView: meDetailsView, parentView: view, navigationBar: navigationBar)    }
   
}
