
import UIKit

class PremiumTableViewCell: UITableViewCell {

    static let identifier = "PremiumTableViewCell"

    // MARK: - UI Components
    
    var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 7
        view.layer.shadowColor = UIColor.systemGray3.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 15
        view.layer.masksToBounds = false
        return view
    }()
    
    let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let mainHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let customLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = logoImg
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let xImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = xImg
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - OverrideInit
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray5
        setUpSubViews()
        setUpContainerConstraints()
        setUpMainHorizontalStackViewConstraints()
        setUpCustomImageViewConstraints()
        setUpVerticalStackView()
        setUpLogoConstraints()
        setUpXimageConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Override Init functions

extension PremiumTableViewCell {
    
    private func setUpSubViews() {
        contentView.addSubview(container)
        container.addSubview(mainHorizontalStackView)
        container.addSubview(xImageView)
        mainHorizontalStackView.addArrangedSubview(customImageView)
        mainHorizontalStackView.addArrangedSubview(verticalStackView)
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(descriptionLabel)
        horizontalStackView.addArrangedSubview(customLabel)
        horizontalStackView.addArrangedSubview(logoImageView)
        
        
    }
    
    private func setUpContainerConstraints(){
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    private func setUpMainHorizontalStackViewConstraints(){
        NSLayoutConstraint.activate([
            mainHorizontalStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            mainHorizontalStackView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
    }
    
    private func setUpCustomImageViewConstraints(){
        // Configure constraints for the image view
        NSLayoutConstraint.activate([
            customImageView.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 1.1/3.0),
            customImageView.widthAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.9/3.0)
        ])
    }
    
    private func setUpVerticalStackView(){
        NSLayoutConstraint.activate([
                   verticalStackView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                   verticalStackView.heightAnchor.constraint(equalTo: mainHorizontalStackView.heightAnchor, multiplier: 1.0/2.0),
               ])
    }
  
        private func setUpLogoConstraints(){
            NSLayoutConstraint.activate([
                logoImageView.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 2/10.0),
                logoImageView.widthAnchor.constraint(equalTo: container.heightAnchor, multiplier: 2/10.0)        ])
        }
    
    private func setUpXimageConstraints(){
        NSLayoutConstraint.activate([
            xImageView.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -20),
            xImageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
            xImageView.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 1.1/5.0),
            xImageView.widthAnchor.constraint(equalTo: container.heightAnchor, multiplier: 1.4/10.0)          ])
    }
}
