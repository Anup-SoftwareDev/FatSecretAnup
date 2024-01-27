//
//  MealCountTableViewCell.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 7/1/2024.
//

import UIKit

protocol MealCountTableDelegate: AnyObject {
    func collapseBtnClicked()
}

class MealCountTableViewCell: UITableViewCell {

    static let identifier = "MealCountTableViewCell"
    var viewModel = DiaryViewModel()
    var delegate: MealCountTableDelegate?
    var onCollapseChanged: (() -> Void)?
    
    var itemsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2 items"
        return label
    }()
    
    let collapseBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        setUpSubViews()
        setUpItemsViewConstraints()
        setUpLabelConstraints()
        setUpCollapseButtonAppearance(button: collapseBtn, isCollapsed: false)
        setUpCollapseBtnConstraints()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpSubViews() {
        contentView.addSubview(itemsView)
        itemsView.addSubview(countLabel)
        itemsView.addSubview(collapseBtn)
    }
    
    private func setUpItemsViewConstraints(){
        NSLayoutConstraint.activate([
            itemsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemsView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setUpCollapseButtonAppearance(button: UIButton, isCollapsed: Bool){
        let imageName = isCollapsed ? "chevron.down" : "chevron.up"
        let boldFont = UIFont.systemFont(ofSize: 16, weight: .heavy)
        button.setImage(UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(font: boldFont)), for: .normal)
        button.addTarget(self, action: #selector(collapseBtnClicked), for: .touchUpInside)
        button.tintColor = .systemGray
    }
    
    @objc func collapseBtnClicked(){
        viewModel.toggleCollapseBtn()
        delegate?.collapseBtnClicked()
        setUpCollapseButtonAppearance(button: collapseBtn, isCollapsed: viewModel.isCollapsed)
        onCollapseChanged?() 
    }
    
    private func setUpLabelConstraints(){
        NSLayoutConstraint.activate([
            countLabel.leadingAnchor.constraint(equalTo: itemsView.leadingAnchor, constant: 72),
            countLabel.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor),
        ])
    }
    
    private func setUpCollapseBtnConstraints(){
        
        NSLayoutConstraint.activate([
            collapseBtn.rightAnchor.constraint(equalTo: itemsView.rightAnchor, constant: -16),
            collapseBtn.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor),
            collapseBtn.heightAnchor.constraint(equalToConstant: 30),
            collapseBtn.widthAnchor.constraint(equalToConstant: 30)
        ])
        
    }

}
