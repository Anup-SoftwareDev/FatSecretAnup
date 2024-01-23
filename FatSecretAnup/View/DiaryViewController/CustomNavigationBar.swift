
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
    var calendarIsHidden = false
    
    private let titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .blue
        return view
    }()

    
    private lazy var titleButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
            button.addTarget(self, action: #selector(titleTapped), for: .touchUpInside)
            return button
        }()
    
    private let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = navTitleDownArrowImg
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var leftBarButton: UIBarButtonItem = {
            let barButton = UIBarButtonItem()
            barButton.image = calendarImg
            barButton.target = self
            barButton.action = #selector(leftBarButtonTapped)
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("TitleView Frame: \(titleView.frame)")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Function to setUpNavigationBar
    func setUpNavigationBar() {
        addSubview(navigationBar)
        setUpNavigationBarBackground()
        setUpNavigationItem()
        //setUpDoneButton()
        //setUpBackButton()
    }

    // Function to setUpNavigationBackground
    private func setUpNavigationBarBackground() {
        navigationBar.barTintColor = fatSecretGreen
        navigationBar.isTranslucent = false
        
    }
 
    private func setUpNavigationItem() {
        
        titleView.addSubview(titleButton)
        titleView.addSubview(imageView)
        titleView.backgroundColor = .blue
        titleButton.setTitle("Today", for: .normal)
        setUpNavigationItemConstraints()
        navigationItem.titleView = titleView
        navigationBar.setItems([navigationItem], animated: false)


        imageView.image = calendarIsHidden ? navTitleUpArrowImg : navTitleDownArrowImg
        navigationItem.leftBarButtonItem = calendarIsHidden ? nil : leftBarButton
        rightBarButton.image = calendarIsHidden ? dateImg : searchImg
        navigationItem.rightBarButtonItem = rightBarButton

    }

    
    private func setUpNavigationItemConstraints(){
            NSLayoutConstraint.activate([
                titleButton.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
                titleButton.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
                imageView.leadingAnchor.constraint(equalTo: titleButton.trailingAnchor),
                imageView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
                imageView.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 15), // Adjust as needed
                imageView.heightAnchor.constraint(equalToConstant: 15), // Adjust as needed
            ])
        titleView.widthAnchor.constraint(equalToConstant: 200).isActive = true // Adjust width as needed
        titleView.heightAnchor.constraint(equalToConstant: 44).isActive = true // Typical navigation bar height
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
        print("titleTapped")
        print(titleView.frame)
        delegate?.navTitleClicked()
        
    }
    
    @objc func leftBarButtonTapped() {
            print("Left bar button tapped")
            delegate?.navTitleClicked()
        }
}

// MARK: - CustomNavigationBar Protocol and Other Call functions

extension CustomNavigationBar {

    // Function called to set NavigationItemTitle
    func setUpNavigationItemTitle(title: String) {
        //navigationItem.title = title
        titleButton.setTitle(title, for: .normal)
        
    }
    
    
}
