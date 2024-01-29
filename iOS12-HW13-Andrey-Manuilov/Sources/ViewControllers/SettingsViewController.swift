import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    // MARK: - Variables
    var models = [[SettingCellModel]]()
    
    private func setupModels() { // TODO: models update and icons
        models = [
            [
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .toggle(isOn: false, action: { isOn in
                    print("Режим модема теперь \(isOn ? "включен" : "выключен")")
                })),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .subtitle("Вкл.")),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron)
            ],
            [
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron)
            ],
            [
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .badge(1)),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron)
            ],
            [
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron)
            ]
        ]
        
        tableView.reloadData()
    }
    
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
        setupModels()
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

