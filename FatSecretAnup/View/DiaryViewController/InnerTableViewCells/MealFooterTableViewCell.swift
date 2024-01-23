//
//  MealFooterTableViewCell.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 7/1/2024.
//

import UIKit

protocol MealFooterBtnDelegate: AnyObject {
    func collapseBottomBtnClicked()
}

class MealFooterTableViewCell: UITableViewCell {

    static let identifier = "MealFooterTableViewCell"
    weak var delegate: MealFooterBtnDelegate?
    var onCollapseChanged: (() -> Void)?
    var viewModel = DiaryViewModel()
    
    var itemsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let verticalBar1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        return view
    }()
    
    let verticalBar2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray3
        return view
    }()
    let logoImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = logoImg
        
        return imgView
    }()
    
    let copyBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Copy", for: .normal)
        button.setTitleColor(fatSecretGreen, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    let saveBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+ Save Meal", for: .normal)
        button.setTitleColor(fatSecretGreen, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    let photoBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+ Photo", for: .normal)
        button.setTitleColor(fatSecretGreen, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    let collapseBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpSubViews()
        setUpItemsViewConstraints()
        setUpLogoConstraints()
        setUpCopyBtn()
        setUpVerticalBar1Constraints()
        setUpSaveBtn()
        setUpPhotoBtn()
        setUpVertica2Bar1Constraints()
        setUpCollapseButtonAppearance(button: collapseBtn, isCollapsed: false)
        setUpCollapseBtnConstraints()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpSubViews() {
        contentView.addSubview(itemsView)
        contentView.backgroundColor = .systemGray5
        itemsView.addSubview(logoImgView)
        itemsView.addSubview(copyBtn)
        itemsView.addSubview(saveBtn)
        itemsView.addSubview(verticalBar1)
        itemsView.addSubview(verticalBar2)
        itemsView.addSubview(photoBtn)
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
    
    private func setUpLogoConstraints(){
        NSLayoutConstraint.activate([
            logoImgView.leadingAnchor.constraint(equalTo: itemsView.leadingAnchor, constant: 20),
            logoImgView.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor),
            logoImgView.widthAnchor.constraint(equalTo: itemsView.heightAnchor, multiplier: 1.2/3),
            logoImgView.heightAnchor.constraint(equalTo: itemsView.heightAnchor, multiplier: 1.2/3)
        ])
    }
    
    private func setUpCopyBtn(){
        NSLayoutConstraint.activate([
            copyBtn.leadingAnchor.constraint(equalTo: logoImgView.trailingAnchor, constant: 5),
            copyBtn.centerYAnchor.constraint(equalTo: logoImgView.centerYAnchor),
        ])
    }
    
    private func setUpVerticalBar1Constraints(){
        NSLayoutConstraint.activate([
            verticalBar1.leadingAnchor.constraint(equalTo: copyBtn.trailingAnchor, constant: 10),
            verticalBar1.widthAnchor.constraint(equalToConstant: 1.0),
            verticalBar1.topAnchor.constraint(equalTo: itemsView.topAnchor, constant: 8),
            verticalBar1.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor)
        ])
    }
    
    private func setUpSaveBtn(){
        NSLayoutConstraint.activate([
            saveBtn.leadingAnchor.constraint(equalTo: verticalBar1.trailingAnchor, constant: 5),
            saveBtn.centerYAnchor.constraint(equalTo: verticalBar1.centerYAnchor),
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
    
    private func setUpVertica2Bar1Constraints(){
        NSLayoutConstraint.activate([
            verticalBar2.leadingAnchor.constraint(equalTo: saveBtn.trailingAnchor, constant: 10),
            verticalBar2.widthAnchor.constraint(equalToConstant: 1.0),
            verticalBar2.topAnchor.constraint(equalTo: itemsView.topAnchor, constant: 8),
            verticalBar2.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor)
        ])
    }
    
    private func setUpPhotoBtn(){
        NSLayoutConstraint.activate([
            photoBtn.leadingAnchor.constraint(equalTo: verticalBar2.trailingAnchor, constant: 5),
            photoBtn.centerYAnchor.constraint(equalTo: verticalBar2.centerYAnchor),
        ])
    }
    
    func setUpCollapseButtonAppearance(button: UIButton, isCollapsed: Bool){
        let boldFont = UIFont.systemFont(ofSize: 16, weight: .heavy)
        collapseBtn.setImage(UIImage(systemName: "chevron.up", withConfiguration: UIImage.SymbolConfiguration(font: boldFont)), for: .normal)
        collapseBtn.tintColor = .systemGray
        collapseBtn.addTarget(self, action: #selector(collapseBtnClicked), for: .touchUpInside)
    }
    
    @objc func collapseBtnClicked(){
        viewModel.toggleCollapseBtn()
        delegate?.collapseBottomBtnClicked()
        onCollapseChanged?()
    }

}
