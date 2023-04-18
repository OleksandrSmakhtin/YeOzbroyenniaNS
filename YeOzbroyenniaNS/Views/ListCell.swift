//
//  ListCell.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 18.04.2023.
//

import UIKit

class ListCell: UITableViewCell {

    //MARK: - Identifier
    static let identifier = "ListCell"
    
    //MARK: - UI Objects
    private let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let circleContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.1)
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        contentView.addSubview(circleContentView)
        circleContentView.addSubview(titleLbl)
    }
    
    //MARK: - Apply constraints
    private func applyConstraints() {
        // circleContentView constraints
        let circleContentViewConstraints = [
            circleContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            circleContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            circleContentView.heightAnchor.constraint(equalToConstant: 60),
            circleContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            circleContentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ]
        
        // titleLbl constraints
        let titleLblConstraints = [
            titleLbl.leadingAnchor.constraint(equalTo: circleContentView.leadingAnchor, constant: 10),
            titleLbl.trailingAnchor.constraint(equalTo: circleContentView.trailingAnchor, constant: -10),
            titleLbl.centerYAnchor.constraint(equalTo: circleContentView.centerYAnchor)
        ]
        
        // activate constraints
        NSLayoutConstraint.activate(circleContentViewConstraints)
        NSLayoutConstraint.activate(titleLblConstraints)
    }

    //MARK: - Configure
    public func configure(with title: String) {
        titleLbl.text = title
    }
    
}
