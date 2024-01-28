

import UIKit

class PremiumViewController: UIViewController {
    
    let premiumDetailsView = UIView()
    let navBarTop = UIView()
    let navigationBar = UINavigationBar()
    let viewModel = PremiumViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpPremiumDetailsView()
    }
    
    private func setUpNavigationBar(){
        viewModel.setUpNavigationBar(view: view, navigationBar: navigationBar)
        viewModel.setUpNavBarTop(navBarTop: navBarTop, view: view, navigationBar: navigationBar)
    }
    private func setUpPremiumDetailsView(){
        self.view.addSubview(premiumDetailsView)
        premiumDetailsView.backgroundColor = .systemGray4
        
        // Setup Constraints for premiumDetailsView
        setUpDetailsViewConstraintsNav(detailsView: premiumDetailsView, parentView: view, navigationBar: navigationBar)
    }

}
