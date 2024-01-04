import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    var itemsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 7
        view.layer.shadowColor = UIColor.systemGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 15 
        view.layer.masksToBounds = false
        return view
    }()
    
    let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = plusImg
        return imageView
    }()
    
    let customPlusImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = plusImg
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
    }()
    
    let customLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray5
        setUpSubViews()
        setUpItemsViewConstraints()
        setUpCustomImageViewConstraints()
        setUpLabelConstraints()
        setUpPlusImageConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpSubViews() {
        contentView.addSubview(itemsView)
        itemsView.addSubview(customImageView)
        itemsView.addSubview(customLabel)
        itemsView.addSubview(plusImageView)
    }
    
    private func setUpItemsViewConstraints(){
        NSLayoutConstraint.activate([
            itemsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            itemsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            itemsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            itemsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    private func setUpCustomImageViewConstraints(){
        // Configure constraints for the image view
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: itemsView.leadingAnchor, constant: 16),
            customImageView.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor),
            customImageView.heightAnchor.constraint(equalTo: itemsView.heightAnchor, multiplier: 1.6/3.0),
            customImageView.widthAnchor.constraint(equalTo: itemsView.heightAnchor, multiplier: 1.6/3.0)
        ])
    }
    
    private func setUpLabelConstraints(){
        NSLayoutConstraint.activate([
            customLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 16),
            customLabel.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor)
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
}
