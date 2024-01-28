//
//  MealItemsTableViewCell.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 8/1/2024.
//

import UIKit

class MealItemsTableViewCell: UITableViewCell {
   
    static let identifier = "MealItemsTableViewCell"
        
        var itemsView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .white
            return view
        }()
        
        
        var foodLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Milk"
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            return label
        }()
    
        var foodServingSizeLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "1 cup"
            label.textColor = fatSecretGreen
            return label
        }()
    
        var caloryCountLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "122"
            return label
        }()
    
        let collapseBtn: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.isEnabled = false
            return button
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.backgroundColor = .systemGray5
            setUpSubViews()
            setUpItemsViewConstraints()
            setUpLabelConstraints()
            setUpFoodServingLblConstraints()
            setUpCollapseButtonAppearance(button: collapseBtn)
            setUpCollapseBtnConstraints()
            setUpLabelConstraints()
            setUpCaloryCountLblConstraints()
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setUpSubViews() {
            contentView.addSubview(itemsView)
            itemsView.addSubview(foodLabel)
            itemsView.addSubview(foodServingSizeLabel)
            itemsView.addSubview(collapseBtn)
            itemsView.addSubview(caloryCountLabel)
        }
        
        private func setUpItemsViewConstraints(){
            NSLayoutConstraint.activate([
                itemsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                itemsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                itemsView.topAnchor.constraint(equalTo: contentView.topAnchor),
                itemsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        }
        
        func setUpCollapseButtonAppearance(button: UIButton){
            let imageName = "chevron.right"
            let boldFont = UIFont.systemFont(ofSize: 16, weight: .heavy)
            collapseBtn.setImage(UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(font: boldFont)), for: .normal)
            collapseBtn.tintColor = .black
        }
        
        private func setUpLabelConstraints(){
            NSLayoutConstraint.activate([
                foodLabel.leadingAnchor.constraint(equalTo: itemsView.leadingAnchor, constant: 72),
                //foodLabel.bottomAnchor.constraint(equalTo: itemsView.centerYAnchor, constant: -3),
                foodLabel.trailingAnchor.constraint(equalTo: itemsView.trailingAnchor, constant: -90),
                foodLabel.topAnchor.constraint(equalTo: itemsView.topAnchor, constant: 10)
            ])
        }
    
        private func setUpFoodServingLblConstraints(){
            NSLayoutConstraint.activate([
                foodServingSizeLabel.bottomAnchor.constraint(equalTo: itemsView.bottomAnchor, constant: -10),
                
                foodServingSizeLabel.leadingAnchor.constraint(equalTo: itemsView.leadingAnchor, constant: 72),
                foodServingSizeLabel.topAnchor.constraint(equalTo: foodLabel.bottomAnchor, constant: 6),
            ])
        }
    
        private func setUpCaloryCountLblConstraints(){
            NSLayoutConstraint.activate([
                caloryCountLabel.trailingAnchor.constraint(equalTo: collapseBtn.leadingAnchor, constant: -16),
                caloryCountLabel.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor)
            ])
        }
        private func setUpCollapseBtnConstraints(){
            
            NSLayoutConstraint.activate([
                collapseBtn.rightAnchor.constraint(equalTo: itemsView.rightAnchor, constant: -30),
                collapseBtn.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor),
                collapseBtn.heightAnchor.constraint(equalToConstant: 13),
                collapseBtn.widthAnchor.constraint(equalToConstant: 7)
            ])
        }
}
