import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    // MARK: - Variables
    var models = [[SettingCellModel]]()
    
    private func setupModels() {
        models = [
            [
                SettingCellModel(iconName: "airplane", title: "Авиарежим", iconBackgroundColor: .systemOrange, accessoryType: .toggle(isOn: false, action: { isOn in
                    print("Авиарежим теперь \(isOn ? "включен" : "выключен")")
                })),
                SettingCellModel(iconName: "wifi", title: "Wi-Fi", iconBackgroundColor: .systemBlue, accessoryType: .subtitle("Не подключено")),
                SettingCellModel(iconName: "bluetooth", title: "Bluetooth", iconBackgroundColor: .systemBlue, accessoryType: .subtitle("Вкл.")),
                SettingCellModel(iconName: "antenna.radiowaves.left.and.right", title: "Сотовая связь", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "personalhotspot", title: "Режим модема", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "vpn", title: "VPN", iconBackgroundColor: .systemBlue, accessoryType: .toggle(isOn: false, action: { isOn in
                    print("VPN теперь \(isOn ? "включен" : "выключен")")
                }))
            ],
            [
                SettingCellModel(iconName: "bell.badge.fill", title: "Уведомления", iconBackgroundColor: .systemRed, accessoryType: .chevron),
                SettingCellModel(iconName: "speaker.wave.3.fill", title: "Звуки, тактильные сигналы", iconBackgroundColor: .systemRed, accessoryType: .chevron),
                SettingCellModel(iconName: "moon.fill", title: "Фокусирование", iconBackgroundColor: .systemIndigo, accessoryType: .chevron),
                SettingCellModel(iconName: "hourglass", title: "Экранное время", iconBackgroundColor: .systemIndigo, accessoryType: .chevron)
            ],
            [
                SettingCellModel(iconName: "gear", title: "Основные", iconBackgroundColor: .systemGray, accessoryType: .badge(1)),
                SettingCellModel(iconName: "switch.2", title: "Пункт управления", iconBackgroundColor: .systemGray, accessoryType: .chevron),
                SettingCellModel(iconName: "action_button", title: "Кнопка действия", iconBackgroundColor: .systemBlue, accessoryType: .chevron),
                SettingCellModel(iconName: "sun.max.fill", title: "Экран и яркость", iconBackgroundColor: .systemBlue, accessoryType: .chevron),
                SettingCellModel(iconName: "home_screen", title: "Экран «Домой»", iconBackgroundColor: .systemIndigo, accessoryType: .chevron),
                SettingCellModel(iconName: "accessibility", title: "Универсальный доступ", iconBackgroundColor: .systemBlue, accessoryType: .chevron),
                SettingCellModel(iconName: "wallpaper", title: "Обои", iconBackgroundColor: .systemCyan, accessoryType: .chevron),
                SettingCellModel(iconName: "standby", title: "Ожидание", iconBackgroundColor: .black, accessoryType: .chevron),
                SettingCellModel(iconName: "siri", title: "Siri и Поиск", iconBackgroundColor: .darkGray, accessoryType: .chevron),
                SettingCellModel(iconName: "faceid", title: "Face ID и код-пароль", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "sos", title: "Экстренный вызов - SOS", iconBackgroundColor: .systemRed, accessoryType: .chevron),
                SettingCellModel(iconName: "exposure", title: "Уведомления о контакте", iconBackgroundColor: .white, accessoryType: .chevron),
                SettingCellModel(iconName: "battery.100", title: "Аккумулятор", iconBackgroundColor: .systemGreen, accessoryType: .chevron),
                SettingCellModel(iconName: "hand.raised.fill", title: "Конфиденциальность", iconBackgroundColor: .systemBlue, accessoryType: .chevron),
            ],
            [
                SettingCellModel(iconName: "appstore", title: "App Store", iconBackgroundColor: .systemCyan, accessoryType: .chevron),
                SettingCellModel(iconName: "wallet", title: "Wallet и Apple Pay", iconBackgroundColor: .darkGray, accessoryType: .chevron)
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

