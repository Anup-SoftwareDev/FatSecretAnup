//
//  PremiumViewModel.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 26/12/2023.
//

import Foundation
import UIKit

class PremiumViewModel {
    
    func setUpNavBarTop(navBarTop: UIView, view: UIView, navigationBar: UINavigationBar){
        view.addSubview(navBarTop)
        navBarTop.backgroundColor = fatSecretGreen
        navBarTop.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navBarTop.topAnchor.constraint(equalTo: view.topAnchor),
            navBarTop.bottomAnchor.constraint(equalTo: navigationBar.topAnchor),
            navBarTop.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBarTop.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    func setUpNavigationBar(view: UIView, navigationBar: UINavigationBar){
        view.addSubview(navigationBar)
        navigationBar.barTintColor = fatSecretGreen
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        let navigationItem = UINavigationItem(title: "Premium")
        navigationBar.setItems([navigationItem], animated: false)    }

}
