//
//  MeViewController.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 21/12/2023.
//

import UIKit

class MeViewController: UIViewController {
    
    let meDetailsView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpMeDetailsView()
    }
    
    private func setUpMeDetailsView(){
        self.view.addSubview(meDetailsView)
        meDetailsView.backgroundColor = .orange
        
        // Setup Constraints for meDetailsView
        setUpDetailsViewConstraints(detailsView: meDetailsView, parentView: view)
    }
   
}
