import UIKit

class FoodSelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, FoodNavigationBarDelegate {
    
    let foodNavigationBar = FoodNavigationBar()
    let tableView = UITableView()
    let bottomView = BottomView()
    var apiResponse: ApiResponse?
    var foodArray: [FoodItemFormatted] = foodArrayToastExample
    //var foodArray: [FoodItemFormatted]!
    var itemSelectedCount = 0
    let totalCalores = 2000

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(foodNavigationBar)
        view.addSubview(tableView)
        foodSelectedCount()
        setUpCustomNavigationBar()
        setUpTableView()
        setUpBottomView()
    }
    
    private func setUpCustomNavigationBar(){
        
        //Setup CustomNavigationBar
        foodNavigationBar.setSearchBarDelegate(delegate: self)
        foodNavigationBar.delegate = self
        self.view.addSubview(foodNavigationBar)
        
        //Setup CustomNavigationBar Constraints
        foodNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodNavigationBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            foodNavigationBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            foodNavigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    // Setup Table View
    private func setUpTableView() {
        // Setup Tableview delegate and DataSource
        tableView.delegate = self
        tableView.dataSource = self
        
        //Setup TableView Cells
        tableView.register(FoodItemCell.self, forCellReuseIdentifier: "FoodItemCell")
        tableView.separatorStyle = .none
        
        //Setup TableView Constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: foodNavigationBar.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    func setUpBottomView(){
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.heightAnchor.constraint(equalToConstant: 80),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        bottomView.delegate = self
    }
    
    func cancelSaveButtonClicked(_ navigationBar: FoodNavigationBar) {
        dismiss(animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            if let searchText = searchBar.text {
                print("Search text: \(searchText)")
                requestAccessToken { accessToken in
                    self.searchFoodData(searchExpression: searchText, accessToken: accessToken){
                        response in self.apiResponse = response
                        }
                    }
                print(foodArray)
                searchBar.resignFirstResponder()
            }
    }
 
}

// MARK: - TableView Delegate and DataSource Functions

extension FoodSelectionViewController {

    // Function to Set the number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodArray.count
    }

    // Function to configure each cell in Table View
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodItemCell", for: indexPath) as! FoodItemCell
        let selected = foodArray[indexPath.row].isSelected
            cell.itemIndex = indexPath.row
            cell.delegate = self
            cell.foodNameLbl.text = foodArray[indexPath.row].foodName
            cell.servingLbl.text = foodArray[indexPath.row].serving
            cell.caloryLbl.text = "RDI \(rdiPrcentageCalc(mealCalory: foodArray[indexPath.row].calories))% - \(foodArray[indexPath.row].calories) kcal"
            cell.selectTickImgView.isHidden = !selected
            cell.tickView.layer.borderColor = selected ? UIColor.systemGreen.cgColor : UIColor.systemGray.cgColor
            cell.tickView.backgroundColor = selected ? .green : .systemGray4
        return cell
    }

    // Function that reseponds to selection or deselection of tableView Cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func rdiPrcentageCalc(mealCalory: Int) -> Int{
        return (mealCalory*100)/totalCalores
    }
}

//  MARK: - FoodItemCellDelegate Delegate

extension FoodSelectionViewController: FoodItemCellDelegate {
    func tickViewClicked(index: Int) {
        foodArray[index].isSelected = !foodArray[index].isSelected
        foodSelectedCount()
        tableView.reloadData()
    }
    
    func foodSelectedCount(){
        itemSelectedCount = 0
        foodArray.forEach{$0.isSelected ? itemSelectedCount = itemSelectedCount + 1 : nil }
        updateNavBottomView()
    }
    
    func updateNavBottomView(){
        foodNavigationBar.updateNavigationBar(selectedItems: itemSelectedCount)
        bottomView.updateBottomView(selectedCount: itemSelectedCount)
    }
}

// MARK: - BottomView Functions

extension FoodSelectionViewController: BottomViewDelegate {
    func unSelectAllClicked() {
        itemSelectedCount = 0
        for index in foodArray.indices {
                foodArray[index].isSelected = false
            }
        updateNavBottomView()
        tableView.reloadData()
    }
}

