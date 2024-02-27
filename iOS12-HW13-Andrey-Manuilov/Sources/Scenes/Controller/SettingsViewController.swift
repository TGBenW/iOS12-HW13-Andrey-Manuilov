import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    // MARK: - Variables
    var models = [[SettingCellModel]]()
    
    // MARK: - Outlets
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.dataSource = self
        table.delegate = self
        return table
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        models = SettingsModelProvider.getModels()
    }

    // MARK: - Setup
    private func setupView() {
        view.backgroundColor = .white
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

