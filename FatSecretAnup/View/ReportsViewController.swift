//
//  ReportsViewController.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 21/12/2023.
//

import UIKit

class ReportsViewController: UIViewController {
    
    let reportsDetailsView = UIView()
    let navBarTop = UIView()
    let navigationBar = UINavigationBar()
    let viewModel = ReportsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpReportsDetailsView()
        
    }
    
    private func setUpNavigationBar(){
        viewModel.setUpNavigationBar(view: view, navigationBar: navigationBar)
        viewModel.setUpNavBarTop(navBarTop: navBarTop, view: view, navigationBar: navigationBar)
    }
    private func setUpReportsDetailsView(){
        
        self.view.addSubview(reportsDetailsView)
        reportsDetailsView.backgroundColor = .systemPurple
        
        // Setup Constraints for reportsDetailsView
        setUpDetailsViewConstraintsNav(detailsView: reportsDetailsView, parentView: view, navigationBar: navigationBar)
    }
}
