//
//  ReportsViewController.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 21/12/2023.
//

import UIKit

class ReportsViewController: UIViewController {
    
    let reportsDetailsView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpReportsDetailsView()
        
    }
    
    private func setUpReportsDetailsView(){
        
        self.view.addSubview(reportsDetailsView)
        reportsDetailsView.backgroundColor = .systemPurple
        
        // Setup Constraints for reportsDetailsView
        setUpDetailsViewConstraints(detailsView: reportsDetailsView, parentView: view)
    }
}
