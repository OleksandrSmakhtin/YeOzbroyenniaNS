//
//  SettingCell.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 20.04.2023.
//

import UIKit

class SettingCell: UITableViewCell {

    //MARK: - Identifier
    static let identifier = "SettingCell"
    
    //MARK: - UI Objects
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .label
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var appearanceSwitch: UISwitch = {
        let uiSwitch = UISwitch()
        let mode = traitCollection.userInterfaceStyle
        if mode == .light {
            uiSwitch.isOn = false
        } else {
            uiSwitch.isOn = true
        }
        uiSwitch.addTarget(self, action: #selector(appearanceAction), for: .allTouchEvents)
        uiSwitch.translatesAutoresizingMaskIntoConstraints = false
        return uiSwitch
    }()
    
    private lazy var disclousereIndicator: UIImageView = {
        let imageView = UIImageView()
        var image = UIImage(named: "arrow", in: nil, with: UIImage.SymbolConfiguration(pointSize: 4))
        image = image?.withTintColor(.label, renderingMode: .automatic)
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - Actions
    @objc private func appearanceAction() {
        if appearanceSwitch.isOn {
            let window = UIApplication.shared.keyWindow
            window?.overrideUserInterfaceStyle = .dark
            print("dark")
        } else {
            let window = UIApplication.shared.keyWindow
            window?.overrideUserInterfaceStyle = .light
            print("white")
        }
    }
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // bg color
        backgroundColor = .clear
        // selection
        selectionStyle = .none
    }
    
    //MARK: - Required init
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Add subviews
    private func addSubviews(isTheme: Bool) {
        contentView.addSubview(titleImageView)
        contentView.addSubview(titleLbl)
        if isTheme {
            contentView.addSubview(appearanceSwitch)
        } else {
            contentView.addSubview(disclousereIndicator)
        }
    }
    
    //MARK: - Apply constraints
    private func applyConstraints(isTheme: Bool) {
        
        // title image view constraints
        let titleImageViewConstraints = [
            titleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        // title lbl constraints
        let titleLblConstraints = [
            titleLbl.leadingAnchor.constraint(equalTo: titleImageView.trailingAnchor, constant: 10),
            titleLbl.centerYAnchor.constraint(equalTo: titleImageView.centerYAnchor)
        ]
        
        // activate constraints
        NSLayoutConstraint.activate(titleImageViewConstraints)
        NSLayoutConstraint.activate(titleLblConstraints)
        
        if isTheme {
            // appearanceSwitch constraints
            let appearanceSwitchConstraints = [
                appearanceSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                appearanceSwitch.centerYAnchor.constraint(equalTo: titleLbl.centerYAnchor)
            ]
            NSLayoutConstraint.activate(appearanceSwitchConstraints)
            
        } else {
            // disclousere Indicator constraints
            let disclousereIndicatorConstraints = [
                disclousereIndicator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                disclousereIndicator.centerYAnchor.constraint(equalTo: titleLbl.centerYAnchor),
                disclousereIndicator.heightAnchor.constraint(equalToConstant: 10),
                disclousereIndicator.widthAnchor.constraint(equalToConstant: 10)
            ]
            NSLayoutConstraint.activate(disclousereIndicatorConstraints)
        }
    }

    //MARK: - Configure
    public func configure(with setting: Setting) {
        titleLbl.text = setting.title
        titleImageView.image = UIImage(systemName: setting.image)
        
        if setting.type == .changeTheme {
            addSubviews(isTheme: true)
            applyConstraints(isTheme: true)
        } else {
            addSubviews(isTheme: false)
            applyConstraints(isTheme: false)
        }
    }

}
