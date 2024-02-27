import UIKit

class DetailViewController: UIViewController {
    private let detailLabel = UILabel() // label to display detail text
    private let iconImageView = UIImageView() // image view to display the icon

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(iconImageView) // add iconImageView as a subview
        view.addSubview(detailLabel) // add detailLabel as a subview
        
        iconImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }

    func setDetailTextAndIcon(_ text: String, icon: UIImage?) {
        detailLabel.text = text
        iconImageView.image = icon ?? UIImage(systemName: "exclamationmark.triangle.fill") // use provided icon or fallback
    }
}
