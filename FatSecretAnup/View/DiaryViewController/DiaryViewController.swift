
import UIKit
import FSCalendar

class DiaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FSCalendarDelegate, FSCalendarDelegateAppearance{

    let viewModel = DiaryViewModel()
    private var autoScrollTimer: Timer?
    private var isCollapsed = false
    private var collectionViewHeightConstraint: NSLayoutConstraint!
    private var tableViewHeightConstraint: NSLayoutConstraint?
    var firstCellRowHeight = 90.0
    var selectedDate = Date()
    
    
    // MARK: - UI Components
    let navBarTop = UIView()
    
    let navigationBar = CustomNavigationBar()
    
    let calendar = FSCalendar()
    
    private let tintView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.isHidden = true
        return view
    }()
    
    private let scrollView = UIScrollView()
    
    private let calendarView: UIView = {
        let view = UIView()
        view.backgroundColor = fatSecretGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var collapseButton = UIButton()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray5
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let collapseLbl: UILabel = {
       let lbl = UILabel()
        lbl.text = "Collapse"
        lbl.textColor = .systemGray
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lbl.isUserInteractionEnabled = true
        return lbl
    }()
    
    private let borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private let summaryView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let gridView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let calRemLbl: UILabel = {
       let lbl = UILabel()
        lbl.text = "Calories Remaining"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .light)
        return lbl
    }()
    
    private let calConsLbl: UILabel = {
       let lbl = UILabel()
        lbl.text = "Calories Consumed"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .light)
        return lbl
    }()
    
    private let calRemValLbl: UILabel = {
       let lbl = UILabel()
        lbl.text = "1985"
        lbl.textColor = .systemGray
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    private let calConsValLbl: UILabel = {
       let lbl = UILabel()
        lbl.text = "215"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray5
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.register(PremiumTableViewCell.self, forCellReuseIdentifier: PremiumTableViewCell.identifier)
        tableView.register(LinksTableViewCell.self, forCellReuseIdentifier: LinksTableViewCell.identifier)
        tableView.register(OuterTableViewCell.self, forCellReuseIdentifier: OuterTableViewCell.identifier)
        tableView.register(SummaryDataTableViewCell.self, forCellReuseIdentifier: SummaryDataTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
        }()
    
    // MARK: - LifeCycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadImagesArray()
        navigationBar.delegate = self
        viewModel.setUpNavBar(navBarTop: navBarTop, view: view, navigationBar: navigationBar)
        viewModel.setUpNavBarTop(navBarTop: navBarTop, view: view, navigationBar: navigationBar)
        setUpCalenderView()
        setupScrollView()
        setupCollectionView()
        setUpCollapseButton()
        setUpCollapseLabel()
        setUpBorderView()
        setUpsummaryDetailView()
        setUpTableView()
        updateTableViewHeight()
        setUpTintView()
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            viewModel.scrollToMiddle(collectionView: collectionView)
            updateTableViewHeight()
            setUpGrid(result: viewModel.totalCaloriesRemainingPercentage())
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            updateTableViewHeight()
            if !isCollapsed{
                startAutoScrolling()
            }
    }

    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            stopAutoScrolling()
    }
    
    // MARK: - ViewDidLoad Functions
    
    private func setUpTintView(){
        tintView.frame = view.bounds
        view.addSubview(tintView)
        let tintTapGesture = UITapGestureRecognizer(target: self, action: #selector(tintTapped))
        tintView.addGestureRecognizer(tintTapGesture)
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: calendarView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        scrollView.showsVerticalScrollIndicator = false
    }
    
    private func setUpCalenderView() {
        view.addSubview(calendarView)
        viewModel.setupCalendarViewConstraints(calendarView: calendarView, navigationBar: navigationBar, view: view)
        calendarView.addSubview(calendar)
        calendar.delegate = self
        setUpCalendarConstraints()
        setUpCalendarAppearance()
    }
    
    private func setUpCalendarConstraints(){
        calendar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: calendarView.topAnchor),
            calendar.leadingAnchor.constraint(equalTo: calendarView.leadingAnchor),
            calendar.trailingAnchor.constraint(equalTo: calendarView.trailingAnchor),
            calendar.heightAnchor.constraint(equalToConstant: 300)
        ])
        calendar.isHidden = true
    }

    private func setUpCalendarAppearance(){

        calendar.firstWeekday = 2
        calendar.appearance.titleDefaultColor = .white
        calendar.appearance.selectionColor = UIColor.green
        calendar.appearance.weekdayTextColor = .white
        calendar.appearance.todayColor = UIColor.green
        customizeWeekdaySymbols()
        calendar.headerHeight = 0
    }

    func customizeWeekdaySymbols() {
            // Set custom weekday symbols
        let dateFormatter = DateFormatter()

        dateFormatter.shortStandaloneWeekdaySymbols = ["M", "T", "W", "T", "F", "S", "S"]
            dateFormatter.veryShortStandaloneWeekdaySymbols = ["M", "T", "W", "T", "F", "S", "S"]
            calendar.calendarWeekdayView.weekdayLabels.forEach { label in
                if let index = calendar.calendarWeekdayView.weekdayLabels.firstIndex(of: label) {
                    label.text = dateFormatter.veryShortStandaloneWeekdaySymbols[index]
                }
            }
        }

    private func setupCollectionView(){
        view.backgroundColor = .systemGray5
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate =  self
        scrollView.addSubview(collectionView)
        viewModel.setupCollectionViewConstraints(collectionView: collectionView, scrollView: scrollView)
    }
    
    private func setUpCollapseButton(){
        viewModel.setUpCollapseButtonAppearance(button: collapseButton, isCollapsed: isCollapsed)
        viewModel.setUpCollapseButtonConstraints(view: view, scrollView: scrollView, button: collapseButton, collectionView: collectionView)
        collapseButton.addTarget(self, action: #selector(collapseButtonTapped), for: .touchUpInside)
    }
    
    private func setUpCollapseLabel(){
        viewModel.setUpCollapseLabel(scrollView: scrollView, collapseLbl: collapseLbl, button: collapseButton, isCollapsed: isCollapsed)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        collapseLbl.addGestureRecognizer(tapGesture)
    }
    
    private func setUpBorderView() {
        viewModel.setUpViews(parentView: view, scrollView: scrollView, childView: borderView, topAnchorConstraint: collapseButton.bottomAnchor, topAnchorConstant: 10, heightAnchorConstant: 1)
        
    }
    
    private func setUpsummaryDetailView(){
        viewModel.setUpViews(parentView: view,scrollView: scrollView, childView: summaryView, topAnchorConstraint: borderView.bottomAnchor, topAnchorConstant: 0, heightAnchorConstant: 65)
        summaryView.addSubview(gridView)
        summaryView.addSubview(calRemLbl)
        summaryView.addSubview(calConsLbl)
        summaryView.addSubview(calRemValLbl)
        summaryView.addSubview(calConsValLbl)
        setUpGridView()
        setUpCaLRemLbl()
        setUpCaLConsLbl()
        setUpCaLConsValLbl()
        setUpCaLRemValLbl()
    }
    
    private func setUpGridView() {
        gridView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gridView.heightAnchor.constraint(equalTo: summaryView.heightAnchor, multiplier: 1.3/2.0),
            gridView.widthAnchor.constraint(equalTo: summaryView.heightAnchor, multiplier: 1.3/2.0),
            gridView.leadingAnchor.constraint(equalTo: summaryView.leadingAnchor, constant: 20),
            gridView.centerYAnchor.constraint(equalTo: summaryView.centerYAnchor)
        ])
    }
    
    private func setUpCaLRemLbl() {
        calRemLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calRemLbl.bottomAnchor.constraint(equalTo: summaryView.centerYAnchor),
            calRemLbl.leadingAnchor.constraint(equalTo: gridView.trailingAnchor, constant: 16)
        ])
        
    }
    
    private func setUpCaLConsLbl() {
        calConsLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calConsLbl.topAnchor.constraint(equalTo: summaryView.centerYAnchor),
            calConsLbl.leadingAnchor.constraint(equalTo: gridView.trailingAnchor, constant: 16)
        ])
        
    }
    
    private func setUpCaLConsValLbl() {
        calConsValLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calConsValLbl.topAnchor.constraint(equalTo: summaryView.centerYAnchor),
            calConsValLbl.trailingAnchor.constraint(equalTo: summaryView.trailingAnchor, constant: -30)
        ])
        calConsValLbl.text = "\(viewModel.totalCaloriesConsumed())"
    }
    
    private func setUpCaLRemValLbl() {
        calRemValLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calRemValLbl.bottomAnchor.constraint(equalTo: summaryView.centerYAnchor),
            calRemValLbl.trailingAnchor.constraint(equalTo: summaryView.trailingAnchor, constant: -30)
        ])
        calRemValLbl.text = "\(viewModel.totalCaloriesRemaining())"
    }
    
    private func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.setUpTableViews(parentView: view, scrollView: scrollView, childView: tableView, topAnchorConstraint: summaryView.bottomAnchor, topAnchorConstant: 0)
       
        // Initialize the height constraint with a placeholder value
        tableViewHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: 0)
                tableViewHeightConstraint?.isActive = true
    }
    
    func updateTableViewHeight() {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        
            // Calculate total height of the table view content
            let totalHeight = tableView.contentSize.height
            tableViewHeightConstraint?.constant = totalHeight
        
            // Refresh layout
            view.layoutIfNeeded()
        }
    
    @objc private func collapseButtonTapped() {
        collapseActivities()
    }
    
    @objc func labelTapped() {
        collapseActivities()
    }
    
    private func collapseActivities(){
        isCollapsed = !isCollapsed
        viewModel.collectionViewHeightConstraint.constant = isCollapsed ? 0 : 130
        isCollapsed ? stopAutoScrolling() : startAutoScrolling()
        setUpCollapseButton()
        setUpCollapseLabel()
        animateUI(duration: 0.5)
    }
    
    private func setUpGrid(result: Int) {
        let gridSize = 10
        let blockSize: CGFloat = (gridView.frame.size.width - CGFloat((gridSize - 1)))/CGFloat(gridSize)
        let spacing: CGFloat = 1         // Total grid size calculation
        var value = result
        for row in 0..<gridSize {
            for column in 0..<gridSize {
                let blockFrame = CGRect(
                    x:  CGFloat(column) * (blockSize + spacing),
                    y: -blockSize + CGFloat(gridSize - row) * (blockSize + spacing),
                    width: blockSize,
                    height: blockSize
                )
                value = value - 1
                let blockView = UIView(frame: blockFrame)
                blockView.backgroundColor = value >= 0 ? fatSecretGreen : .systemGray2
                self.gridView.addSubview(blockView)
            }
        }
    }
    
    // MARK: - AutoScrolling functions

    private func startAutoScrolling() {
            autoScrollTimer = Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
    }

    private func stopAutoScrolling() {
            autoScrollTimer?.invalidate()
            autoScrollTimer = nil
    }

    @objc private func scrollToNextItem() {
            viewModel.scrollToNextItem(collectionView: collectionView)
    }
}

    // MARK: - Collection View DataSource, Delegate functions

extension DiaryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
                fatalError("Failed to dequeue CustomCollectionViewCell in HomeController.")
            }
            let image = viewModel.images[indexPath.row]
            cell.configure(with: image)
            return cell
    }
}

// MARK: - Collection View DelegateFlowLayout functions

extension DiaryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = viewModel.calculateWidthCollectionItem(view: scrollView)
        return CGSize(width: width, height: width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}

// MARK: - TableView Functions

extension DiaryViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                return configureMealsTableViewCells(indexPath: indexPath)
            case 4, 5:
                return configurePremiumTableViewCells(indexPath: indexPath)
            case 7:
                return configureSummaryTableViewCells(indexPath: indexPath)
            case 8:
                return configureLinksTableViewCells(indexPath: indexPath)
            default:
                return configureCustomTableViewCells(indexPath: indexPath)
            }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? firstCellRowHeight : CGFloat(rowHeights[indexPath.row])
    }
    
    private func configurePremiumTableViewCells(indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: PremiumTableViewCell.identifier, for: indexPath) as! PremiumTableViewCell
            cell.customLabel.text = mealNames[indexPath.row]
            cell.customImageView.image = mealsImages[indexPath.row]
            cell.descriptionLabel.text =  indexPath.row == 5 ? "Track your daily hydration goals" : "Track more than the main meals"
        return cell
    }
    private func configureLinksTableViewCells(indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: LinksTableViewCell.identifier, for: indexPath) as! LinksTableViewCell
        return cell
    }
    
    private func configureSummaryTableViewCells(indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: SummaryDataTableViewCell.identifier, for: indexPath) as! SummaryDataTableViewCell
        cell.viewModel =  viewModel
        return cell
    }
    
    private func configureMealsTableViewCells(indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: OuterTableViewCell.identifier, for: indexPath) as! OuterTableViewCell
        cell.onHeightChanged = { [weak self, weak tableView] in
                                    DispatchQueue.main.async {
                                        tableView?.reloadRows(at: [indexPath], with: .none)
                                    }
                            }
        cell.delegate = self
        cell.viewController = self
        cell.viewModel = viewModel
        cell.configureCell()
        self.firstCellRowHeight = cell.newHeight + 20.0
        return cell
    }
    
    private func configureCustomTableViewCells(indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.customLabel.text = mealNames[indexPath.row]
        cell.customImageView.image = mealsImages[indexPath.row]
        cell.itemsView.backgroundColor = indexPath.row == 6 ? .systemGray5 : .white
        cell.plusImageView.isHidden = indexPath.row == 6
        cell.customLabel.font = indexPath.row == 6 ? UIFont.systemFont(ofSize: 20, weight: .regular): UIFont.systemFont(ofSize: 20, weight: .semibold)
        return cell
    }
}

// MARK: - OuterTableViewCellDelgate Protocol functions

extension DiaryViewController: OuterTableViewCellDelegate {
    
    func cellDidTriggerAlert(index: Int) {
        deleteMealAlert(index)
    }
    
    func deleteMealAlert(_ index: Int) {
        let alertController = UIAlertController(title: "Delete Meal", message: viewModel.mealNameFromIndex(index: index), preferredStyle: .alert)

        let deleteAction = UIAlertAction(title: "Delete", style: .default) { _ in
            self.handleDelete(index: index, option: 1)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in
            self.handleDelete(index: index, option: 2)
        }
        presentAlert(alertController: alertController, action1: deleteAction, action2: cancelAction)
    }
    
    func handleDelete(index: Int, option: Int) {
        viewModel.deleteMealArrayItem(index: index, option: option)
        tableView.reloadData()
        setUpCaLConsValLbl()
        setUpCaLRemValLbl()
    }
}

// MARK: - MealHeadingDelgate Protocol functions

extension DiaryViewController: MealHeadingDelegate {
    
    func plusImageViewClicked() {
        //addMealAlert(title: "Meal Consumed", message: "Select Meal", optionOneTitle: "Milk", optionTwoTitle: "Egg Omelette")
        let foodSelectionViewController = FoodSelectionViewController()
        foodSelectionViewController.modalPresentationStyle = .overFullScreen // or .fullScreen
        present(foodSelectionViewController, animated: true)
    }

    func addMealAlert (title: String, message: String, optionOneTitle: String, optionTwoTitle: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let optionOneAction = UIAlertAction(title: optionOneTitle, style: .default) { _ in
            self.handleOption(1)
        }
        let optionTwoAction = UIAlertAction(title: optionTwoTitle, style: .default) { _ in
            self.handleOption(2)
        }
        presentAlert(alertController: alertController, action1: optionOneAction, action2: optionTwoAction)
    }
    
    func handleOption(_ value: Int) {
        viewModel.BreakFastItems.append(mealItems[value - 1])
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        setUpCaLConsValLbl()
        setUpCaLRemValLbl()
    }
    
    private func presentAlert(alertController: UIAlertController, action1: UIAlertAction, action2: UIAlertAction){
        alertController.addAction(action1)
        alertController.addAction(action2)
        present(alertController, animated: true)
        
    }
}


// MARK: - MealCountTableDelgate Protocol functions

extension DiaryViewController: MealCountTableDelegate {
    func collapseBtnClicked() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - MealFooterBtnDelegate Protocol functions

extension DiaryViewController: MealFooterBtnDelegate {
    func collapseBottomBtnClicked() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - CustomNavigationBarDelegate Protocol functions

extension DiaryViewController: CustomNavigationBarDelegate {
 
    func navTitleClicked() {
        calendarOpenCloseActivities()
    }
    
    func calendarOpenCloseActivities(){
        viewModel.calendarIsHidden = !viewModel.calendarIsHidden
        viewModel.calendarHeightConstraint.constant = viewModel.calendarIsHidden ? 0 : 300
        navigationBar.calendarIsHidden = viewModel.calendarIsHidden
        navigationBar.setUpNavigationItem()
        viewModel.calendarIsHidden ? disableTintView() : showTintView()
        viewModel.calendarIsHidden ? dateToFullFormat(date: selectedDate) : dateToMonthFormat()
        self.calendar.isHidden = viewModel.calendarIsHidden
        animateUI(duration: 0.2)
    }
    
}

// MARK: - Animate UI

extension DiaryViewController {
    func animateUI(duration: Double) {
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - TintView Functions

extension DiaryViewController {
    @objc func tintTapped(){
        calendarOpenCloseActivities()
    }
    
    private func showTintView(){
        tintView.isHidden = false
        view.subviews.forEach { $0.isUserInteractionEnabled = false }
        view.bringSubviewToFront(tintView)
        view.bringSubviewToFront(calendarView)
        view.bringSubviewToFront(navigationBar)
        view.bringSubviewToFront(navBarTop)
        tintView.isUserInteractionEnabled = true
        calendarView.isUserInteractionEnabled = true
        navigationBar.isUserInteractionEnabled = true
        navBarTop.isUserInteractionEnabled = true
    }
    
    private func disableTintView(){
        tintView.isHidden = true
        view.subviews.forEach { $0.isUserInteractionEnabled = true }
    }
}

// MARK: - Calendar Delegate and Other Functions

extension DiaryViewController {
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
            if Calendar.current.isDateInToday(date) {
                return .red
            }
            return nil
        }

    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
            if Calendar.current.isDateInToday(date) {
                return .white
            }
            return nil
        }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        selectedDate = date
        calendarOpenCloseActivities()
    }

    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        dateToMonthFormat()
    }
    
    func dateToMonthFormat(){
        let currentMonthString = formatDate(date: calendar.currentPage, dateFormat: "MMMM")
        setUpNavigationTitle(dateString: currentMonthString)
    }
    
    func dateToFullFormat(date: Date) {
        selectedDate = date
        let formattedDateString = formatDate(date: selectedDate, dateFormat: "EEEE, MMM d")
        setUpNavigationTitle(dateString: formattedDateString)
    }
    
    private func formatDate(date: Date, dateFormat: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let formatedString = dateFormatter.string(from: date)
        return formatedString
    }
    
    private func setUpNavigationTitle(dateString: String){
        navigationBar.date = dateString
        navigationBar.setUpNavigationItem()
    }
}
