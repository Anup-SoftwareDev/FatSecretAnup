//
//  HomeViewController.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 21/12/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeDetailsView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpHomeDetailsView()
    }
    
    private func setUpHomeDetailsView(){
        
        self.view.addSubview(homeDetailsView)
        homeDetailsView.backgroundColor = .systemCyan
        
        // Setup Constraints for HomeDetailsView
        setUpDetailsViewConstraints(detailsView: homeDetailsView, parentView: view)
    }
    
    
}
