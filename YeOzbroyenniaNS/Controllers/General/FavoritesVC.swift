//
//  FavoritesVC.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 20.04.2023.
//

import UIKit

class FavoritesVC: UIViewController {

    //MARK: - UI Objects
    private let topSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let listTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor(named: "tableColor")
        table.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let bgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // configure nav bar
        configureNavBar()
        // add subviews
        addSubviews()
        // apply constraints
        applyConstraints()

    }
    
    //MARK: - viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bgImageView.frame = view.frame
    }

    //MARK: - Add subviews
    private func addSubviews() {
        view.addSubview(bgImageView)
        view.addSubview(topSeparatorView)
        view.addSubview(listTable)
    }
    
    //MARK: - Apply constraints
    private func applyConstraints() {
        // topSeparatorView constraints
        let topSeparatorViewConstraints = [
            topSeparatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topSeparatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topSeparatorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            topSeparatorView.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        // listTable constraints
        let listTableConstraints = [
            listTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listTable.topAnchor.constraint(equalTo: topSeparatorView.bottomAnchor, constant: 20),
            listTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        // activate constraints
        NSLayoutConstraint.activate(topSeparatorViewConstraints)
        NSLayoutConstraint.activate(listTableConstraints)
    }
    
    //MARK: - Configure nav bar
    private func configureNavBar() {
        title = "Обрані"
    }
}

//MARK: - Lifecycle
extension FavoritesVC {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
}
