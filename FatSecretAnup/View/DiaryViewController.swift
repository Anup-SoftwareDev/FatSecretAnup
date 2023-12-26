//
//  DiaryViewController.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 20/12/2023.
//

import UIKit

class DiaryViewController: UIViewController {

    let diaryDetailsView = UIView()
    let navBarTop = UIView()
    let segueButton = UIButton()
    let navigationBar = UINavigationBar()
    let viewModel = DiaryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpDiaryDetailsView()
        setUpButton()
        
    }
    
    private func setUpNavigationBar(){
        viewModel.setUpNavigationBar(view: view, navigationBar: navigationBar)
        viewModel.setUpNavBarTop(navBarTop: navBarTop, view: view, navigationBar: navigationBar)
    }
    
    private func setUpDiaryDetailsView(){
        view.addSubview(diaryDetailsView)
        diaryDetailsView.backgroundColor = .white
        
        // Setup Constraints for diaryDetailsView
        setUpDetailsViewConstraintsNav(detailsView: diaryDetailsView, parentView: view, navigationBar: navigationBar)
    }
    
    private func setUpButton(){
        self.view.addSubview(segueButton)
        segueButton.setTitle("SegueButton", for: .normal )
        segueButton.backgroundColor = .systemBlue
        segueButton.layer.cornerRadius = 15
        segueButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        //segueButton.setTitleColor(.black, for: .normal)
        segueButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            segueButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            segueButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    @objc func buttonClicked(){
        print("button clicked")
        let newViewController = SegueTestViewController()
        
        self.present(newViewController, animated: true)
        
    }
}
