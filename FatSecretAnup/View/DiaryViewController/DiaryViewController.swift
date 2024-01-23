
import UIKit


class DiaryViewController: UIViewController{
    let viewModel = DiaryViewModel()

    // MARK: - UI Components
    let navBarTop = UIView()
    
    let navigationBar = CustomNavigationBar()

    // MARK: - LifeCycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavBar()
        setUpNavBarTop()
        navigationBar.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
    }
    
    func setUpNavBarTop(){
        view.addSubview(navBarTop)
        navBarTop.backgroundColor = fatSecretGreen
        navBarTop.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navBarTop.topAnchor.constraint(equalTo: view.topAnchor),
            navBarTop.bottomAnchor.constraint(equalTo: navigationBar.topAnchor),
            navBarTop.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBarTop.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    func setUpNavBar(){
        view.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
}

// MARK: - MealFooterBtnDelegate Protocol functions

extension DiaryViewController: CustomNavigationBarDelegate {
 
    func navTitleClicked() {
        print("Item is clicked")
    }

}
