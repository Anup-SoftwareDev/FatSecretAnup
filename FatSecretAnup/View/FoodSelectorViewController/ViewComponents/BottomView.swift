
import UIKit

protocol BottomViewDelegate: AnyObject {
    func unSelectAllClicked()
}

class BottomView: UIView {
    
    var delegate: BottomViewDelegate?
    
    // UI Components
    
    let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "1 item Selected"
        lbl.font = .systemFont(ofSize: 12)
        lbl.isHidden = true
        lbl.isUserInteractionEnabled = true
        return lbl
    }()
    
    let button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Unselect all", for: .normal)
        btn.setTitleColor(.systemGreen, for: .normal)
        btn.tintColor = .systemGreen
        btn.titleLabel?.font = .systemFont(ofSize: 12)
        btn.isHidden = true
        return btn
    }()
    
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "camera.fill")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.isHidden = false
       
        return imgView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        setUpLabel()
        setUpButton()
        setUpImgView()
       
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpImgView(){
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setUpLabel(){
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    private func setUpButton(){
        addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: label.bottomAnchor),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    func updateBottomView(selectedCount: Int){
        let selected = selectedCount != 0
        imageView.isHidden =  selected
        label.isHidden = !selected
        button.isHidden = !selected
        label.text = selectedCount == 1 ?  "1 item Selected" : "\(selectedCount) items Selected"
    }
    
    private func addGesturizers(){
        let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(buttonClicked))
        label.addGestureRecognizer(labelTapGesture)
    }
    
    @objc func buttonClicked(){
        delegate?.unSelectAllClicked()
    }
}
