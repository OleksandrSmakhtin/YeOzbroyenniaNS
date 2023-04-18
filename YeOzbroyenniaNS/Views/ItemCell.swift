//
//  ItemCell.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 18.04.2023.
//

import UIKit

class ItemCell: UITableViewCell {

    //MARK: - Identifier
    static let identifier = "ItemCell"
    
    //MARK: - UI Objects
    private let nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textColor = .label
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let valueLbl: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.textColor = .label
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // bg color
        backgroundColor = .clear
        // selection
        selectionStyle = .none
        // add subviews
        addSubviews()
        // apply constraints
        applyConstraints()
    }
    
    //MARK: - Required init
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Add subviews
    private func addSubviews() {
        contentView.addSubview(nameLbl)
        contentView.addSubview(valueLbl)
    }
    
    //MARK: - Apply constraints
    private func applyConstraints() {
        // nameLbl constraints
        let nameLblConstraints = [
            nameLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLbl.widthAnchor.constraint(equalToConstant: contentView.frame.width/2 - 20),
            nameLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ]
        
        // valueLbl constraints
        let valueLblConstraints = [
            valueLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            valueLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            valueLbl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            valueLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            valueLbl.widthAnchor.constraint(equalToConstant: contentView.frame.width/2 - 10)
        ]
        
        // activate constraints
        NSLayoutConstraint.activate(nameLblConstraints)
        NSLayoutConstraint.activate(valueLblConstraints)
    }

    //MARK: - Configure
    public func configure(with name: String, value: String) {
        nameLbl.text = name
        valueLbl.text = value
    }

}
