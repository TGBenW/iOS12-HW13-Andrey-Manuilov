import UIKit

enum ModelColor {
    case systemOrange
    case systemBlue
    case systemGreen
    case systemRed
    case systemIndigo
    case systemGray
    case systemCyan
    case darkGray
    case black
    case white
}

extension ModelColor {
    var toUIColor: UIColor {
        switch self {
        case .systemOrange: return .systemOrange
        case .systemBlue: return .systemBlue
        case .systemGreen: return .systemGreen
        case .systemRed: return .systemRed
        case .systemIndigo: return .systemIndigo
        case .systemGray: return .systemGray
        case .systemCyan: return .systemCyan
        case .darkGray: return .darkGray
        case .black: return .black
        case .white: return .white
        }
    }
}
