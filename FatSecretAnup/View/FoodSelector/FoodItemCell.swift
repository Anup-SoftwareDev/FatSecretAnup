//
//  RegionCell.swift
//  RegionsListOptimised
//
//  Created by Anup Kuriakose on 27/11/2023.
//



import UIKit

protocol FoodItemCellDelegate: AnyObject {
    func tickViewClicked(index: Int)
}

class FoodItemCell: UITableViewCell {
    
    var delegate: FoodItemCellDelegate?
    var itemIndex: Int?
    
    // UI Components

    let selectTickImgView = UIImageView()
    let foodNameLbl: UILabel = {
        let label = UILabel()
        label.text = "Toasted White Bread"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let servingLbl: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.text = "1 slice"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let caloryLbl: UILabel = {
        let label = UILabel()
        label.text = "RDI 3% - 69 kcal"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    
    let separatorLine = UIView()
    
    let tickView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1.2
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let selectTickImg = UIImage(systemName: "checkmark")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Add all elements in the TableView Cell
        setUpSubViews()

        // Add Initial images into ImageViews
        initialiseImagesandLabels()

        // Setup All constraints
        setUpFoodNameLblConstraints()
        setUpServingLblConstraints()
        setUpCaloryLblConstraints()
        setUpSelectImgViewConstraints()
        setUpSeparatorLineConstraints()
        setUpGestureRecognizers()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Subviews

    // Setup SubViews
    private func setUpSubViews() {
        contentView.addSubview(foodNameLbl)
        contentView.addSubview(servingLbl)
        contentView.addSubview(caloryLbl)
        contentView.addSubview(tickView)
        contentView.addSubview(separatorLine)
        tickView.addSubview(selectTickImgView)
        
    }

    // MARK: - Initialize Images and Labels

    private func initialiseImagesandLabels() {
        selectTickImgView.image = selectTickImg?.withTintColor(.white, renderingMode: .alwaysOriginal)
    }

    // MARK: - Setup All Constraints

    // RegionNameLbl Constraints
    private func setUpFoodNameLblConstraints() {
        foodNameLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodNameLbl.bottomAnchor.constraint(equalTo: servingLbl.topAnchor, constant: -5),
            foodNameLbl.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            foodNameLbl.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -50),
            foodNameLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
        ])
    }
    
    private func setUpServingLblConstraints() {
        servingLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            servingLbl.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            servingLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            ])
            
    }
    
    private func setUpCaloryLblConstraints() {
        caloryLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            caloryLbl.leftAnchor.constraint(equalTo: servingLbl.rightAnchor, constant: 15),
            caloryLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    // SelectImgView Constraints
    private func setUpSelectImgViewConstraints() {

                NSLayoutConstraint.activate([
                    tickView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
                    tickView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                    tickView.heightAnchor.constraint(equalToConstant: 25),
                    tickView.widthAnchor.constraint(equalToConstant: 25)
                ])
        selectTickImgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectTickImgView.centerXAnchor.constraint(equalTo: tickView.centerXAnchor),
            selectTickImgView.centerYAnchor.constraint(equalTo: tickView.centerYAnchor),
            selectTickImgView.heightAnchor.constraint(equalTo: tickView.heightAnchor, multiplier: 0.75),
            selectTickImgView.widthAnchor.constraint(equalTo: tickView.heightAnchor, multiplier: 0.75)
        ])
        tickView.layer.cornerRadius = (25)/2    // row height is 53
    }

    
    // SeparatorLine Constraints
    private func setUpSeparatorLineConstraints() {
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        separatorLine.backgroundColor = .systemGray5
        NSLayoutConstraint.activate([
            separatorLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorLine.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            separatorLine.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            separatorLine.heightAnchor.constraint(equalToConstant: 0.6)
        ])
    }
    
    private func setUpGestureRecognizers() {
        let tickViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(tickViewTapped))
        tickView.addGestureRecognizer(tickViewTapGesture)
    }
    
    @objc func tickViewTapped() {
        delegate?.tickViewClicked(index: itemIndex!)
    }
    
}

