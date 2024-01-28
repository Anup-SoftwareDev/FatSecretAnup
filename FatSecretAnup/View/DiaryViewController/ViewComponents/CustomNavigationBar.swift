
import UIKit

// MARK: - CustomNavigationBarDelegate Protocol

protocol CustomNavigationBarDelegate: AnyObject {
    func navTitleClicked()
}

// MARK: - CustomNavigationBar Class

class CustomNavigationBar: UIView {

    let navigationBar = UINavigationBar()
    var navigationItem = UINavigationItem()
    weak var delegate: CustomNavigationBarDelegate?
    let viewModel = DiaryViewModel()
    var calendarIsHidden = true
    var date = "Today"
    let defaultDateImg = UIImage(systemName: "28.square", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withTintColor(.white, renderingMode: .alwaysOriginal)
    
    private let titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 19)
        let titleTapGesture = UITapGestureRecognizer(target: self, action: #selector(titleTapped))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(titleTapGesture)
        return label
    }()

    
    private let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = navTitleDownArrowImg
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private let leftBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.image = calendarImg
        return barButton
    }()
    
    private let rightBarButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.image = searchImg
        return barButton
    }()
    // MARK: - Initialization Functions

    // Override Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpNavigationBar()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Function to setUpNavigationBar
    func setUpNavigationBar() {
        addSubview(navigationBar)
        setUpNavigationBarBackground()
        setUpNavigationItem()
    }

    // Function to setUpNavigationBackground
    private func setUpNavigationBarBackground() {
        navigationBar.barTintColor = fatSecretGreen
        navigationBar.isTranslucent = false
        
    }
 
    func setUpNavigationItem() {
        titleView.addSubview(titleLabel)
        titleView.addSubview(imageView)
        titleLabel.text = date
        setUpNavigationItemConstraints()
        navigationItem.titleView = titleView
        navigationBar.setItems([navigationItem], animated: false)
        
        imageView.image = calendarIsHidden ?  navTitleDownArrowImg : navTitleUpArrowImg
        navigationItem.leftBarButtonItem = calendarIsHidden ? leftBarButton : nil
        rightBarButton.image = calendarIsHidden ? searchImg : setCurrentDateImg()
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func setCurrentDateImg() -> UIImage{
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let formattedDateString = dateFormatter.string(from: currentDate)
        let dateImg = UIImage(systemName: "\(formattedDateString).square", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        return dateImg ?? defaultDateImg!
    }
    
    private func setUpNavigationItemConstraints(){
        NSLayoutConstraint.activate([
                titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
                imageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
                imageView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 30),
                imageView.heightAnchor.constraint(equalToConstant: 15),
        ])
        titleView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    // SetUp Constraints Function
    private func setUpConstraints() {
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        // SetUp Navigation Bar Constraints
        NSLayoutConstraint.activate([
            navigationBar.leftAnchor.constraint(equalTo: leftAnchor),
            navigationBar.rightAnchor.constraint(equalTo: rightAnchor),
            navigationBar.topAnchor.constraint(equalTo: topAnchor),
            navigationBar.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    @objc func titleTapped() {
        delegate?.navTitleClicked()
    }
}
// MARK: - CustomNavigationBar Protocol and Other Call functions

extension CustomNavigationBar {
    // Function called to set NavigationItemTitle
    func setUpNavigationItemTitle(title: String) {
        navigationItem.title = title
    }
}
