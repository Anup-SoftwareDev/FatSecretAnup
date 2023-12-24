//
//  DiaryViewController.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 20/12/2023.
//

import UIKit

class DiaryViewController: UIViewController {

    let diaryDetailsView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = fatSecretGreen
        setUpDiaryDetailsView()
    }
    
    private func setUpDiaryDetailsView(){
        
        self.view.addSubview(diaryDetailsView)
        //diaryDetailsView.backgroundColor = .systemGray5
        diaryDetailsView.backgroundColor = .white
        
        // Setup Constraints for diaryDetailsView
        setUpDetailsViewConstraints(detailsView: diaryDetailsView, parentView: view)
    }
}
