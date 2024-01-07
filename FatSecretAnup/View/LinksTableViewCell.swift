//
//  LinksTableViewCell.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 4/1/2024.
//

import UIKit

class LinksTableViewCell: UITableViewCell {
    
    static let identifier = "LinksTableViewCell"
    
    let verticalTodayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let verticalAlbumStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let verticalMealsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let verticalExportStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let verticalOptionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let verticalOverAllStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let horizontalTopStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let horizontalBottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let todayImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = todayImg
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let albumImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = albumImg
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let mealsImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = mealsImg
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let exportImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = exportImg
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let optionsImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = optionsImg
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let todayLbl: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.textColor = fatSecretGreen
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let albumLbl: UILabel = {
        let label = UILabel()
        label.text = "Album"
        label.textColor = fatSecretGreen
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mealsLbl: UILabel = {
        let label = UILabel()
        label.text = "Meal Plans"
        label.textColor = fatSecretGreen
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let exportLbl: UILabel = {
        let label = UILabel()
        label.text = "Export"
        label.textColor = fatSecretGreen
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let optionsLbl: UILabel = {
        let label = UILabel()
        label.text = "Options"
        label.textColor = fatSecretGreen
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray5
        contentView.addSubview(verticalOverAllStackView)
        verticalOverAllStackView.addArrangedSubview(horizontalTopStackView)
        verticalOverAllStackView.addArrangedSubview(horizontalBottomStackView)
        
        horizontalTopStackView.addArrangedSubview(verticalTodayStackView)
        verticalTodayStackView.addArrangedSubview(todayImgView)
        verticalTodayStackView.addArrangedSubview(todayLbl)
        
        horizontalTopStackView.addArrangedSubview(verticalAlbumStackView)
        verticalAlbumStackView.addArrangedSubview(albumImgView)
        verticalAlbumStackView.addArrangedSubview(albumLbl)
        
        horizontalTopStackView.addArrangedSubview(verticalMealsStackView)
        verticalMealsStackView.addArrangedSubview(mealsImgView)
        verticalMealsStackView.addArrangedSubview(mealsLbl)
        
        horizontalBottomStackView.addArrangedSubview(verticalExportStackView)
        verticalExportStackView.addArrangedSubview(exportImgView)
        verticalExportStackView.addArrangedSubview(exportLbl)
        
        horizontalBottomStackView.addArrangedSubview(verticalOptionsStackView)
        verticalOptionsStackView.addArrangedSubview(optionsImgView)
        verticalOptionsStackView.addArrangedSubview(optionsLbl)
        
        NSLayoutConstraint.activate([
            verticalOverAllStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalOverAllStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            verticalOverAllStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            verticalOverAllStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            horizontalTopStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalTopStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalTopStackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0/2.0)
        ])
        
        NSLayoutConstraint.activate([
            horizontalBottomStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalBottomStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        setUpImageView(imgView: todayImgView)
        setUpImageView(imgView: albumImgView)
        setUpImageView(imgView: mealsImgView)
        setUpImageView(imgView: exportImgView)
        setUpImageView(imgView: optionsImgView)

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpImageView(imgView: UIImageView){
        NSLayoutConstraint.activate([
            imgView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.0/13.0),
            imgView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.0/7.0)
        ])
    }

}
