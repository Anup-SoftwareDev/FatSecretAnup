//
//  PremiumViewController.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 20/12/2023.
//

import UIKit

class PremiumViewController: UIViewController {
    
    let premiumDetailsView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = fatSecretGreen
        setUpPremiumDetailsView()
    }
    
    private func setUpPremiumDetailsView(){
        self.view.addSubview(premiumDetailsView)
        premiumDetailsView.backgroundColor = .systemGray4
        
        // Setup Constraints for premiumDetailsView
        setUpDetailsViewConstraints(detailsView: premiumDetailsView, parentView: view)
    }

}
