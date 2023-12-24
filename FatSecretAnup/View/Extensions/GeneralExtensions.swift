//
//  Extensions.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 22/12/2023.
//

import Foundation
import UIKit

// Colors used in the project
var fatSecretGreen = UIColor(red: 79/255.0, green: 163/255.0, blue: 42/255.0, alpha: 0.95)
var tabBarGray =  UIColor(red: 92/255.0, green: 91/255.0, blue: 88/255.0, alpha: 1)


// Function to layout constraints for ViewControllers
func setUpDetailsViewConstraints(detailsView: UIView, parentView: UIView){
    detailsView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        detailsView.topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor),
        detailsView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
        detailsView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
        detailsView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
    ])
}
