//import UIKit
//
//class DiaryViewController1: UIViewController, UITableViewDataSource, UITableViewDelegate{
//
//    let diaryDetailsView = UIView()
//    let navBarTop = UIView()
//    let navigationBar = UINavigationBar()
//    let viewModel = DiaryViewModel()
//    private var autoScrollTimer: Timer?
//    private var isCollapsed = false
//    private var collectionViewHeightConstraint: NSLayoutConstraint!
//    let items = [("Breakfast", "balanced"), ("Lunch", "balanced"), ("Dinner", "balanced"),("Snacks/Other", "balanced"), ("CustomMeals", "balanced"), ("Water Tracker", "balanced"), ("Add Exercise/Sleep", "balanced"), ("Item 2", "balanced"), ("Item 3", "balanced")]
//    private var tableViewHeightConstraint: NSLayoutConstraint?
//    
//    // MARK: - UI Components
//    private let scrollView = UIScrollView()
//    
//    private var collapseButton = UIButton()
//    
//    private let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .systemGray5
//        
//        collectionView.showsHorizontalScrollIndicator = false
//        return collectionView
//    }()
//    
//    private let collapseLbl: UILabel = {
//       let lbl = UILabel()
//        lbl.text = "Collapse"
//        lbl.textColor = .systemGray
//        lbl.font = UIFont.systemFont(ofSize: 14, weight: .bold)
//        lbl.isUserInteractionEnabled = true
//        return lbl
//    }()
//    
//    private let borderView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .systemGray4
//        return view
//    }()
//    
//    private let summaryView: UIView = {
//        let view = UIView()
//        return view
//    }()
//    
//    private let tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.backgroundColor = .systemGray5
//        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
//        tableView.rowHeight = 100
//        tableView.separatorStyle = .none
//        return tableView
//        }()
//    
//    // MARK: - LifeCycle functions
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        viewModel.loadImagesArray()
//        viewModel.setUpNavigationBar(view: view, navigationBar: navigationBar, navBarTop: navBarTop)
//        setupScrollView()
//        setupCollectionView()
//        setUpCollapseButton()
//        setUpCollapseLabel()
//        setUpBorderView()
//        setUpsummaryDetailView()
//        setUpTableView()
//    }
//    
//    override func viewDidLayoutSubviews() {
//            super.viewDidLayoutSubviews()
//            viewModel.scrollToMiddle(collectionView: collectionView)
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//            super.viewDidAppear(animated)
//            updateTableViewHeight()
//        //collectionView.reloadData()
////                    if !isCollapsed{
////                startAutoScrolling()
////            }
//        }
//
//    override func viewWillDisappear(_ animated: Bool) {
//            super.viewWillDisappear(animated)
//            stopAutoScrolling()
//    }
//    
//    // MARK: - ViewDidLoad Functions
//    
//    func setupScrollView() {
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(scrollView)
//        
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//        scrollView.showsVerticalScrollIndicator = false
//    }
//    
//    private func setupCollectionView(){
//        view.backgroundColor = .systemGray5
//        //view.addSubview(collectionView)
//        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
//        collectionView.dataSource = self
//        collectionView.delegate =  self
//        scrollView.addSubview(collectionView)
//        //viewModel.setupCollectionViewConstraints(view: view, collectionView: collectionView, navigationBar: navigationBar)
//        viewModel.setupCollectionViewConstraints(view: scrollView, collectionView: collectionView, scrollView: scrollView)
//    }
//    
//    private func setUpCollapseButton(){
//        viewModel.setUpCollapseButtonAppearance(button: collapseButton, isCollapsed: isCollapsed)
//        //viewModel.setUpCollapseButtonConstraints(view: view, button: collapseButton, collectionView: collectionView)
//        viewModel.setUpCollapseButtonConstraints(view: view, scrollView: scrollView, button: collapseButton, collectionView: collectionView)
//        collapseButton.addTarget(self, action: #selector(collapseButtonTapped), for: .touchUpInside)
//    }
//    
//    private func setUpCollapseLabel(){
//        
////        viewModel.setUpCollapseLabel(view: view, collapseLbl: collapseLbl, button: collapseButton, isCollapsed: isCollapsed)
//        viewModel.setUpCollapseLabel(scrollView: scrollView, collapseLbl: collapseLbl, button: collapseButton, isCollapsed: isCollapsed)
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
//        collapseLbl.addGestureRecognizer(tapGesture)
//    }
//    
//    private func setUpBorderView() {
////        viewModel.setUpViews(parentView: view, childView: borderView, topAnchorConstraint: collapseButton.bottomAnchor, topAnchorConstant: 15, heightAnchorConstant: 1)
//        viewModel.setUpViews(parentView: view, scrollView: scrollView, childView: borderView, topAnchorConstraint: collapseButton.bottomAnchor, topAnchorConstant: 15, heightAnchorConstant: 1)
//        
//    }
//    
//    private func setUpsummaryDetailView(){
////        viewModel.setUpViews(parentView: view, childView: summaryView, topAnchorConstraint: borderView.bottomAnchor, topAnchorConstant: 0, heightAnchorConstant: 80)
//        viewModel.setUpViews(parentView: view,scrollView: scrollView, childView: summaryView, topAnchorConstraint: borderView.bottomAnchor, topAnchorConstant: 0, heightAnchorConstant: 80)
//    }
//    
//    private func setUpTableView(){
//        tableView.dataSource = self
//        tableView.delegate = self
////        viewModel.setUpTableViews(parentView: view, childView: tableView, topAnchorConstraint: summaryView.bottomAnchor, topAnchorConstant: 0)
//        viewModel.setUpTableViews(parentView: view, scrollView: scrollView, childView: tableView, topAnchorConstraint: summaryView.bottomAnchor, topAnchorConstant: 0)
//       
//        // Initialize the height constraint with a placeholder value
//        tableViewHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: 0)
//                tableViewHeightConstraint?.isActive = true
//
//        // Update the table view height after reloading data
//        //updateTableViewHeight()
//    }
//    
//    func updateTableViewHeight() {
//            tableView.reloadData()
//
//            // Calculate total height of the table view content
//            let totalHeight = tableView.contentSize.height
//            tableViewHeightConstraint?.constant = totalHeight
//
//            // Refresh layout
//            view.layoutIfNeeded()
//        }
//    
//    @objc private func collapseButtonTapped() {
//        collapseActivities()
//    }
//    
//    @objc func labelTapped() {
//        collapseActivities()
//    }
//    
//    private func collapseActivities(){
//        isCollapsed = !isCollapsed
//        viewModel.collectionViewHeightConstraint.constant = isCollapsed ? 0 : 125
//        //isCollapsed ? stopAutoScrolling() : startAutoScrolling()
//        UIView.animate(withDuration: 0.5) {
//            self.view.layoutIfNeeded()
//        }
//        setUpCollapseButton()
//        setUpCollapseLabel()
//    }
//    
//    // MARK: - AutoScrolling functions
//
//    private func startAutoScrolling() {
//            autoScrollTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
//    }
//
//    private func stopAutoScrolling() {
//            autoScrollTimer?.invalidate()
//            autoScrollTimer = nil
//    }
//
//    @objc private func scrollToNextItem() {
//            viewModel.scrollToNextItem(collectionView: collectionView)
//    }
//}
//
//    // MARK: - Collection View DataSource, Delegate functions
//
//extension DiaryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(viewModel.images.count)
//        return viewModel.images.count
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
//            fatalError("Failed to dequeue CustomCollectionViewCell in HomeController.")
//        }
//        let image = viewModel.images[indexPath.row]
//        cell.configure(with: image)
//        return cell
//    }
//}
//
//// MARK: - Collection View DelegateFlowLayout functions
//
//extension DiaryViewController: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = viewModel.calculateWidthCollectionItem(view: scrollView)
//        return CGSize(width: width, height: width/2)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
//    
//}
//
//extension DiaryViewController {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
//
//        let (labelText, imageName) = items[indexPath.row]
//
//        cell.customLabel.text = labelText
//        cell.customImageView.image = UIImage(named: imageName)
//        cell.customButton.setTitle("Button", for: .normal)
//
//        // You can add target actions for the button here if needed
//
//        return cell
//    }
//}