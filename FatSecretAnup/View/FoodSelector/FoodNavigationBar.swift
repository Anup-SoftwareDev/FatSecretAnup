
import UIKit

// MARK: - CustomNavigationBarDelegate Protocol

protocol FoodNavigationBarDelegate: AnyObject {
    func cancelSaveButtonClicked(_ navigationBar: FoodNavigationBar)
}

// MARK: - CustomNavigationBar Class

class FoodNavigationBar: UIView {
    
    let navHeadingBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        return view
    }()
    
    let leftBarButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        return view
    }()
    
    let leftButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let mealTimeLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Breakfast"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let foodLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "FOOD"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    let dateLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Thursday, Jan 25"
        label.textColor = .systemGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    let searchBar = UISearchBar()
    let navigationBar = UINavigationBar()
    var navigationItem = UINavigationItem()
    var cancelSaveLbl = UILabel()
    weak var delegate: FoodNavigationBarDelegate?

    // MARK: - Initialization Functions

    // Override Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add SubViews
        addSubview(navigationBar)
        addSubview(navHeadingBar)
        navHeadingBar.addSubview(foodLbl)
        addSubview(searchBar)
        
        // SetUp NavigationBar and Constraints
        setUpNavigationBar()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Function to setUpNavigationBar
    func setUpNavigationBar() {
        setUpNavigationBarBackground()
        setUpCancelSaveButton()
        setUpBackButton()
        setUpSearchBarAppearance()
    }

    // Function to setUpNavigationBackground
    private func setUpNavigationBarBackground() {
        navigationBar.isTranslucent = false
        navigationBar.setItems([navigationItem], animated: false)
       
    }

    // Function to setUpDoneButton
    private func setUpCancelSaveButton() {
        cancelSaveLbl.text = "Cancel"
        cancelSaveLbl.font = .systemFont(ofSize: 18, weight: .semibold)
        cancelSaveLbl.textColor = .systemGreen
        cancelSaveLbl.textAlignment = .right
        let cancelSaveButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(cancelSaveButtonTapped))
        cancelSaveLbl.isUserInteractionEnabled = true
        cancelSaveLbl.addGestureRecognizer(cancelSaveButtonTapGesture)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cancelSaveLbl)
        
        NSLayoutConstraint.activate([
            cancelSaveLbl.widthAnchor.constraint(equalToConstant: 80)
        ])
    }

    // Function to setUpBackButton
    private func setUpBackButton() {
        leftBarButtonView.addSubview(mealTimeLbl)
        leftBarButtonView.addSubview(dateLbl)
        
        NSLayoutConstraint.activate([
            dateLbl.bottomAnchor.constraint(equalTo: leftBarButtonView.bottomAnchor, constant: 15),
            mealTimeLbl.bottomAnchor.constraint(equalTo: dateLbl.topAnchor),
        ])
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarButtonView)
    }
    
    private func setUpSearchBarAppearance(){
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
                textField.backgroundColor = .white
                textField.layer.borderColor = UIColor.systemGray2.cgColor 
                textField.layer.borderWidth = 1.5
                textField.layer.cornerRadius = 15.0
                textField.clipsToBounds = true
            }
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.layer.borderWidth = 1.0
        searchBar.placeholder = "Search a Food - like \("Toast")"
    }

    // SetUp Constraints Function
    func setUpConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        // SetUp Navigation Bar Constraints
        NSLayoutConstraint.activate([
            navigationBar.leftAnchor.constraint(equalTo: leftAnchor),
            navigationBar.rightAnchor.constraint(equalTo: rightAnchor),
            navigationBar.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            navHeadingBar.leftAnchor.constraint(equalTo: leftAnchor),
            navHeadingBar.rightAnchor.constraint(equalTo: rightAnchor),
            navHeadingBar.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            navHeadingBar.heightAnchor.constraint(equalTo: navigationBar.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            foodLbl.centerXAnchor.constraint(equalTo: navHeadingBar.centerXAnchor),
            foodLbl.centerYAnchor.constraint(equalTo: navHeadingBar.centerYAnchor),
            foodLbl.heightAnchor.constraint(equalTo: navigationBar.heightAnchor, multiplier: 1/1),
            foodLbl.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        // SetUp SearchBar Constraints
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: navHeadingBar.bottomAnchor),
            searchBar.leftAnchor.constraint(equalTo: leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: rightAnchor),
            searchBar.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - CustomNavigationBar Protocol and Other Call functions

extension FoodNavigationBar {

    // Selector function to respond to doneButtonTapped
    @objc func cancelSaveButtonTapped() {
        delegate?.cancelSaveButtonClicked(self)
    }
    
    // Function called to set SearchBar delegate from another class
    func setSearchBarDelegate(delegate: UISearchBarDelegate) {
        searchBar.delegate = delegate
    }

    // Function to clear SearchBar
    func clearSearchBar() {
        searchBar.text = ""
    }
    
    func updateNavigationBar(selectedItems: Int){
        cancelSaveLbl.text = selectedItems == 0 ? "Cancel" : "Save(\(selectedItems))"
    }
}
