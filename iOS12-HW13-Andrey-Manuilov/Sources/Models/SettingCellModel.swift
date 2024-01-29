import UIKit

// MARK: - SettingCellModel and AccessoryType
struct SettingCellModel {
    let iconName: String
    let title: String
    let iconBackgroundColor: UIColor
    var accessoryType: AccessoryType
    var action: ((Bool) -> Void)?
}

enum AccessoryType {
    case none
    case chevron
    case toggle(isOn: Bool, action: (Bool) -> Void)
    case subtitle(String)
    case badge(Int)
}
