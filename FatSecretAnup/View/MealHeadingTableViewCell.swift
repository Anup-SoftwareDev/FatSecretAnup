//
//  InnerTableViewCell.swift
import UIKit

protocol MealHeadingDelegate: AnyObject {
    func plusImageViewClicked()
}

class MealHeadingTableViewCell: UITableViewCell {
    
    static let identifier = "MealHeadingTableViewCell"
    var delegate: MealHeadingDelegate?
    
    var itemsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let MealLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let caloryValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "215"
        label.isHidden = true
        return label
    }()
    
    let caloryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Calories"
        return label
    }()
    
    let plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = plusImg
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray5
        setUpSubViews()
        setUpItemsViewConstraints()
        setUpCustomImageViewConstraints()
        setUpLabelConstraints()
        setUpPlusImageConstraints()
        SetUpCaloryNameLblConstraints()
        SetUpCaloryValueLblConstraints()
        plusImgTap()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpSubViews() {
        contentView.addSubview(itemsView)
        itemsView.addSubview(customImageView)
        itemsView.addSubview(MealLabel)
        itemsView.addSubview(caloryNameLabel)
        itemsView.addSubview(caloryValueLabel)
        itemsView.addSubview(plusImageView)
    }
    
    private func setUpItemsViewConstraints(){
        NSLayoutConstraint.activate([
            itemsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemsView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setUpCustomImageViewConstraints(){
        // Configure constraints for the image view
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: itemsView.leadingAnchor, constant: 16),
            customImageView.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor),
            customImageView.heightAnchor.constraint(equalTo: itemsView.heightAnchor, multiplier: 1.3/3.0),
            customImageView.widthAnchor.constraint(equalTo: itemsView.heightAnchor, multiplier: 1.6/3.0)
        ])
    }
    
    private func setUpLabelConstraints(){
        NSLayoutConstraint.activate([
            MealLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 16),
            MealLabel.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor)
        ])
    }
    
    private func SetUpCaloryNameLblConstraints() {
        NSLayoutConstraint.activate([
            caloryNameLabel.trailingAnchor.constraint(equalTo: plusImageView.leadingAnchor, constant: -10),
            caloryNameLabel.topAnchor.constraint(equalTo: plusImageView.centerYAnchor),
        ])
        
    }
    
    private func SetUpCaloryValueLblConstraints() {
        NSLayoutConstraint.activate([
            caloryValueLabel.trailingAnchor.constraint(equalTo: plusImageView.leadingAnchor, constant: -10),
            caloryValueLabel.bottomAnchor.constraint(equalTo: plusImageView.centerYAnchor),
        ])
        
    }
    private func setUpPlusImageConstraints(){
        NSLayoutConstraint.activate([
            plusImageView.trailingAnchor.constraint(equalTo: itemsView.trailingAnchor, constant: -16),
            plusImageView.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor),
            plusImageView.heightAnchor.constraint(equalTo: itemsView.heightAnchor, multiplier: 1.5/3.0),
            plusImageView.widthAnchor.constraint(equalTo: itemsView.heightAnchor, multiplier: 1.5/3.0)
        ])
    }
    
    private func plusImgTap(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(plusImgTapped))
        plusImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func plusImgTapped(){
        delegate?.plusImageViewClicked()
    }
}

