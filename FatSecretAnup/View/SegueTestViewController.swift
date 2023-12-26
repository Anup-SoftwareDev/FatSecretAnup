//
//  SegueTestViewController.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 26/12/2023.
//

import UIKit

class SegueTestViewController: UIViewController {
    let segueTestDetailsView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = fatSecretGreen
        segueTestDetailsView.backgroundColor = .cyan
        
        view.addSubview(segueTestDetailsView)
        setUpDetailsViewConstraints(detailsView: segueTestDetailsView, parentView: view)
    }
   
}
