
import UIKit

class SummaryDataTableViewCell: UITableViewCell {
    
    static let identifier = "SummaryDataTableViewCell"
    var viewModel = DiaryViewModel()
    
    let gridView: UIView = {
        let view = UIView()
        return view
    }()
    
    let dataView: UIView = {
        let view = UIView()
        return view
    }()
    
    let summaryLbl: UILabel = {
        let label = UILabel()
        label.text = "Summary"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let calRemLbl: UILabel = {
       let lbl = UILabel()
        lbl.text = "Calories Remaining"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return lbl
    }()
    
    private let calConsLbl: UILabel = {
       let lbl = UILabel()
        lbl.text = "Calories Consumed"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return lbl
    }()
    
    private let calRemValLbl: UILabel = {
       let lbl = UILabel()
        lbl.text = "1985"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lbl
    }()
    
    private let calConsValLbl: UILabel = {
       let lbl = UILabel()
        lbl.text = "215"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return lbl
    }()
    
    private let totalLbl: UILabel = {
       let lbl = UILabel()
        lbl.text = "0% of RDI"
        lbl.textColor = .gray
        // Use a specific font name that supports light and italic
            if let font = UIFont(name: "HelveticaNeue-LightItalic", size: 14) {
                lbl.font = font
            } else {
                lbl.font = UIFont.italicSystemFont(ofSize: 14) // Fallback to italic system font
            }
        return lbl
    }()
    
    private let totalValLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.textColor = UIColor.darkGray
        // Use a specific font name that supports light and italic
            if let font = UIFont(name: "HelveticaNeue-Italic", size: 14) {
                lbl.font = font
            } else {
                lbl.font = UIFont.italicSystemFont(ofSize: 14) // Fallback to italic system font
            }

        return lbl
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    let separatorBottom: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray5
        setUpGridView()
        setUpDataView()
        setUpSummaryLbl()
        setUpCaLRemLbl()
        setUpCaLConsLbl()
        setUpSeparator()
        setUpSeparatorBottom()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpGrid(result: viewModel.totalCaloriesRemainingPercentage())
        setUpCaLConsValLbl()
        setUpCaLRemValLbl()
        setUpTotalLbl()
        setUpTotalValLbl()
    }

    private func setUpGridView() {
        contentView.addSubview(gridView)
        gridView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gridView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.3/2.0),
            gridView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1.3/2.0),
            gridView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            gridView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
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
                blockView.backgroundColor = value >= 0 ? fatSecretGreen : .systemGray3
                self.gridView.addSubview(blockView)
            }
        }
    }
    
    private func setUpDataView(){
        contentView.addSubview(dataView)
        //dataView.backgroundColor = .green
        dataView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataView.heightAnchor.constraint(equalTo: gridView.heightAnchor),
            dataView.trailingAnchor.constraint(equalTo: gridView.leadingAnchor, constant: -20),
            dataView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            dataView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func setUpSummaryLbl() {
        dataView.addSubview(summaryLbl)
        summaryLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            summaryLbl.heightAnchor.constraint(equalToConstant: 20),
            summaryLbl.leadingAnchor.constraint(equalTo: dataView.leadingAnchor),
            summaryLbl.topAnchor.constraint(equalTo: dataView.topAnchor)
        ])
    }
    
    private func setUpCaLRemLbl() {
        dataView.addSubview(calRemLbl)
        calRemLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calRemLbl.topAnchor.constraint(equalTo: dataView.topAnchor, constant: 25),
            calRemLbl.leadingAnchor.constraint(equalTo: dataView.leadingAnchor)
        ])
        
    }
    
    private func setUpCaLConsLbl() {
        dataView.addSubview(calConsLbl)
        calConsLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calConsLbl.topAnchor.constraint(equalTo: calRemLbl.bottomAnchor, constant: 5),
            calConsLbl.leadingAnchor.constraint(equalTo: dataView.leadingAnchor)
        ])
    }
    
    private func setUpCaLConsValLbl() {
        dataView.addSubview(calConsValLbl)
        calConsValLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calConsValLbl.trailingAnchor.constraint(equalTo: dataView.trailingAnchor),
            calConsValLbl.centerYAnchor.constraint(equalTo: calConsLbl.centerYAnchor)
        ])
        calConsValLbl.text = "\(viewModel.totalCaloriesConsumed())"
    }
    
    private func setUpCaLRemValLbl() {
        dataView.addSubview(calRemValLbl)
        calRemValLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calRemValLbl.trailingAnchor.constraint(equalTo: dataView.trailingAnchor),
            calRemValLbl.centerYAnchor.constraint(equalTo: calRemLbl.centerYAnchor)
        ])
        calRemValLbl.text = "\(viewModel.totalCaloriesRemaining())"
    }
    
    private func setUpSeparator() {
        dataView.addSubview(separator)
        separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.trailingAnchor.constraint(equalTo: dataView.trailingAnchor),
            separator.leadingAnchor.constraint(equalTo: dataView.leadingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.topAnchor.constraint(equalTo: calConsLbl.bottomAnchor, constant: 5)
        ])
    }
    
    private func setUpTotalLbl() {
        dataView.addSubview(totalLbl)
        totalLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalLbl.leadingAnchor.constraint(equalTo: dataView.leadingAnchor),
            totalLbl.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 5)
        ])
        totalLbl.text = "\(viewModel.totalCaloriesRemainingPercentage())% of RDI"
    }
    
    private func setUpTotalValLbl() {
        dataView.addSubview(totalValLbl)
        totalValLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalValLbl.trailingAnchor.constraint(equalTo: dataView.trailingAnchor),
            totalValLbl.centerYAnchor.constraint(equalTo: totalLbl.centerYAnchor)
        ])
        totalValLbl.text = "\(viewModel.caloryTarget)"
    }
    
    private func setUpSeparatorBottom() {
        contentView.addSubview(separatorBottom)
        separatorBottom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separatorBottom.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            separatorBottom.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            separatorBottom.heightAnchor.constraint(equalToConstant: 1),
            separatorBottom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
