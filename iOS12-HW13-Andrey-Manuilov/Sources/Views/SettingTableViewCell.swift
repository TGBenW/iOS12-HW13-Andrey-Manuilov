import UIKit
import SnapKit

// MARK: - SettingTableViewCell
class SettingTableViewCell: UITableViewCell {
    static let identifier = "SettingTableViewCell"
    
    var toggleAction: ((Bool) -> Void)? // closure for toggle action

    private let iconContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8 // rounded corners for the icon container
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit // aspect ratio of icons
        imageView.tintColor = .white // default white color for icons
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label // dynamic color for light/dark mode
        label.numberOfLines = 0 // allow multiline text
        label.lineBreakMode = .byWordWrapping // long title word wrapping
        return label
    }()
    
    private let accessoryImageView: UIImageView = { // accessory image settings
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit // aspect ratio
        imageView.image = UIImage(systemName: "chevron.right") // chevron
        imageView.tintColor = .systemGray // gray color
        return imageView
    }()
    
    private let subtitleLabel: UILabel = { // subtitles settings
        let label = UILabel()
        label.textColor = .systemGray // gray color
        label.font = .systemFont(ofSize: 16) // default font size
        return label
    }()
    
    private let badgeContainerView: UIView = { // badge container settings
        let view = UIView()
        view.backgroundColor = .systemRed // red bg
        view.layer.cornerRadius = 15 // round corners
        return view
    }()
    
    private let badgeLabel: UILabel = { // badge text settings
        let label = UILabel()
        label.textAlignment = .center // center alignment
        label.textColor = .white // white text color
        label.font = .systemFont(ofSize: 16) // font size
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(iconContainerView)
        iconContainerView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(accessoryImageView)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(badgeContainerView)
        badgeContainerView.addSubview(badgeLabel) // add badge label to its container

        setupConstraints()
    }
    
    private func setupConstraints() {
        iconContainerView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 32, height: 32))
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.size.equalTo(iconContainerView.snp.size).multipliedBy(0.72)
            make.center.equalTo(iconContainerView.snp.center)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconContainerView.snp.trailing).offset(16)
            make.centerY.equalToSuperview()
        }
        
        accessoryImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.trailing.equalTo(accessoryImageView.snp.leading).offset(-8)
            make.centerY.equalToSuperview()
        }
        
        badgeContainerView.snp.makeConstraints { make in
            make.trailing.equalTo(accessoryImageView.snp.leading).offset(-8)
            make.centerY.equalToSuperview()
        }
        
        badgeLabel.snp.makeConstraints { make in
            make.center.equalTo(badgeContainerView.snp.center)
        }
    }
    
    func configure(with model: SettingCellModel) {
        if let imageFromAssets = UIImage(named: model.iconName) { // load image from assets or SF symbols, fallback to placeholder if not found
            iconImageView.image = imageFromAssets
        } else if let imageFromSystem = UIImage(systemName: model.iconName) {
            iconImageView.image = imageFromSystem
        } else {
            iconImageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
        }
        titleLabel.text = model.title
        iconContainerView.backgroundColor = model.iconBackgroundColor
            
        subtitleLabel.isHidden = true // hide elements initially, will show based on accessory type
        badgeContainerView.isHidden = true
        accessoryImageView.isHidden = true
            
        switch model.accessoryType {
        case .none: break // do nothing for none type
        case .chevron: // show chevron, remove accessory view if present
            accessoryImageView.isHidden = false
            selectionStyle = .default
            accessoryView = nil
        case .toggle(let isOn, let action): // setup toggle switch
            let toggleSwitch = UISwitch()
            toggleSwitch.isOn = isOn
            toggleSwitch.addAction(UIAction(handler: { _ in
                action(toggleSwitch.isOn)
            }), for: .valueChanged)
            accessoryView = toggleSwitch
            selectionStyle = .none
        case .subtitle(let subtitle): // show subtitle and chevron
            subtitleLabel.isHidden = false
            subtitleLabel.text = subtitle
            accessoryImageView.isHidden = false
            accessoryView = nil
        case .badge(let number): // show badge and chevron
            badgeLabel.isHidden = false
            badgeLabel.text = "\(number)"
            badgeContainerView.isHidden = false
            accessoryImageView.isHidden = false
            accessoryView = nil
        }

        subtitleLabel.snp.remakeConstraints { make in // update constraints for subtitle and badge
            make.centerY.equalToSuperview()
            make.trailing.equalTo(accessoryImageView.snp.leading).offset(-8)
        }
        
        badgeContainerView.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(accessoryImageView.snp.leading).offset(-8)
            make.width.height.equalTo(30)
        }
        
        badgeLabel.snp.remakeConstraints { make in
            make.center.equalTo(badgeContainerView.snp.center)
        }
    }
}
