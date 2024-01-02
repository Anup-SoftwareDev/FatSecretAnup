import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    let itemsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        // Assuming you have a UIView named 'customView' inside your UITableViewCell
        view.layer.shadowColor = UIColor.systemGray3.cgColor
        view.layer.shadowOpacity = 0.8 // Adjust the opacity as needed
        view.layer.shadowOffset = CGSize(width: 0, height: 5) // Adjust the offset as needed
        view.layer.shadowRadius = 15 // Adjust the radius as needed
        view.layer.masksToBounds = false
        return view
    }()
    
    let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let customLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let customButton: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray5
        
        contentView.addSubview(itemsView)
        itemsView.addSubview(customImageView)
        itemsView.addSubview(customLabel)
        itemsView.addSubview(customButton)
        
        // Configure constraints for the image view
        NSLayoutConstraint.activate([
            itemsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            itemsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            itemsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            itemsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        

        // Configure constraints for the image view
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: itemsView.leadingAnchor, constant: 16),
            customImageView.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor),
            customImageView.widthAnchor.constraint(equalToConstant: 40),
            customImageView.heightAnchor.constraint(equalToConstant: 40)
        ])

        // Configure constraints for the label
        NSLayoutConstraint.activate([
            customLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 16),
            customLabel.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor)
        ])

        // Configure constraints for the button
        NSLayoutConstraint.activate([
            customButton.trailingAnchor.constraint(equalTo: itemsView.trailingAnchor, constant: -16),
            customButton.centerYAnchor.constraint(equalTo: itemsView.centerYAnchor),
            customButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
