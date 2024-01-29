import UIKit

class DetailViewController: UIViewController {
    private let detailLabel = UILabel() // label to display detail text

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(detailLabel) // add detailLabel as a subview
        detailLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    func setDetailText(_ text: String) {
        detailLabel.text = text // set text of detailLabel
    }
}
