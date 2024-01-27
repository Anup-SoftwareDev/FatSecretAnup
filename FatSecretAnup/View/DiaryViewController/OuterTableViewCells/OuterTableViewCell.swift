
import UIKit

protocol OuterTableViewCellDelegate: AnyObject {
    func cellDidTriggerAlert(index: Int)
}

class OuterTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    static let identifier = "OuterTableViewCell"
    var viewModel = DiaryViewModel()
    var viewController = DiaryViewController()
    var onHeightChanged: (() -> Void)?
    var newHeight = 160.0
    
    weak var delegate: OuterTableViewCellDelegate?
    
    private lazy var tableViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.systemGray2.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 5
        view.layer.masksToBounds = false
        return view
    }()
    
    private lazy var innerTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MealHeadingTableViewCell.self, forCellReuseIdentifier: MealHeadingTableViewCell.identifier)
        tableView.register(MealCountTableViewCell.self, forCellReuseIdentifier: MealCountTableViewCell.identifier)
        tableView.register(MealFooterTableViewCell.self, forCellReuseIdentifier: MealFooterTableViewCell.identifier)
        tableView.register(MealItemsTableViewCell.self, forCellReuseIdentifier: MealItemsTableViewCell.identifier)
        tableView.layer.cornerRadius = 7
        //tableView.backgroundColor = .green
    
        tableView.layer.masksToBounds = true
        return tableView
    }()
    
    private var innerTableViewHeightConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray5
        contentView.addSubview(tableViewContainer)
        tableViewContainer.addSubview(innerTableView)
        NSLayoutConstraint.activate([
            tableViewContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableViewContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableViewContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableViewContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        innerTableViewHeightConstraint = innerTableView.heightAnchor.constraint(equalToConstant: 68)
        NSLayoutConstraint.activate([
            innerTableView.topAnchor.constraint(equalTo: tableViewContainer.topAnchor, constant: 5),
            innerTableView.leadingAnchor.constraint(equalTo: tableViewContainer.leadingAnchor, constant: 10),
            innerTableView.trailingAnchor.constraint(equalTo: tableViewContainer.trailingAnchor, constant: -10),
            innerTableViewHeightConstraint,
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableRowsCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MealCountTableViewCell.identifier, for: indexPath) as? MealCountTableViewCell else {
                    fatalError("Failed to dequeue InnerTableViewCell")
                }
            cell.countLabel.text = ("\(viewModel.BreakFastItems.count) items")
            cell.contentView.backgroundColor = viewModel.isCollapsed ? .systemGray5 : .white
            cell.delegate = viewController
            cell.viewModel = viewModel
            cell.onCollapseChanged = { [weak self, weak tableView] in
                self?.reloadData()
            }
            cell.setUpCollapseButtonAppearance(button: cell.collapseBtn, isCollapsed: viewModel.isCollapsed)
            return cell

        }else if indexPath.row == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MealHeadingTableViewCell.identifier, for: indexPath) as? MealHeadingTableViewCell else {
                fatalError("Failed to dequeue InnerTableViewCell")
            }
            if indexPath.row == 0 {
                cell.MealLabel.text = mealNames[indexPath.row]
                cell.customImageView.image = mealsImages[indexPath.row]
                cell.caloryValueLabel.text = ("\(viewModel.totalCaloriesConsumed())")
                cell.caloryValueLabel.isHidden = !viewModel.mealsNotEmpty()
                cell.caloryNameLabel.isHidden = !viewModel.mealsNotEmpty()
                cell.delegate = viewController
            } else {
                cell.MealLabel.text = "Empty"
            }
            return cell
            
        } else if indexPath.row == viewModel.tableRowsCount() - 1 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MealFooterTableViewCell.identifier, for: indexPath) as? MealFooterTableViewCell else {
                    fatalError("Failed to dequeue InnerTableViewCell")
                }
            cell.viewModel = viewModel
            cell.itemsView.backgroundColor = .systemGray5
            cell.onCollapseChanged = { [weak self, weak tableView] in
                self?.reloadData()
            }
            return cell
            
        }  else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MealItemsTableViewCell.identifier, for: indexPath) as? MealItemsTableViewCell else {
                    fatalError("Failed to dequeue InnerTableViewCell")
                }
            cell.foodLabel.text = "\(viewModel.BreakFastItems[indexPath.row - 2].name)"
            cell.foodServingSizeLabel.text = "\(viewModel.BreakFastItems[indexPath.row - 2].serving)"
            cell.caloryCountLabel.text = "\(viewModel.BreakFastItems[indexPath.row - 2].calories)"
            return cell
        }
    }
    
    func configureCell() {
            reloadData() // Initial data load
        }

    func reloadData() {
        innerTableView.reloadData()
        innerTableView.layoutIfNeeded()
        newHeight = innerTableView.contentSize.height
                if innerTableViewHeightConstraint.constant != newHeight {
                    innerTableViewHeightConstraint.constant = newHeight
                    onHeightChanged?()
                }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        reloadData()
        indexPath.row > 1 && indexPath.row < viewModel.tableRowsCount() - 1 ? delegate?.cellDidTriggerAlert(index: indexPath.row - 2) : nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 1 || (indexPath.row > 2 && indexPath.row == viewModel.tableRowsCount() - 1) {
            return 39
        } else {
            return 57
        }
    }
}
