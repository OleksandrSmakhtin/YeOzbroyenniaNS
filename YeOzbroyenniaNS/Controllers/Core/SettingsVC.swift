//
//  SettingsVC.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 16.04.2023.
//

import UIKit

class SettingsVC: UIViewController {
    
    //MARK: - Data
    private let settings = SettingsData.shared.getSettings()
    
    //MARK: - UI Objects
    private let topSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let settingsTable: UITableView = {
        let table = UITableView()
        table.register(SettingCell.self, forCellReuseIdentifier: SettingCell.identifier)
        table.showsVerticalScrollIndicator = false
        table.isScrollEnabled = false
        table.backgroundColor = UIColor(named: "tableColor")
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
        // configute nav bar
        configureNavBar()
        // add subviews
        addSubviews()
        // apply constraints
        applyConstraints()
        // apply delegates
        applyTableDelegates()
        
    }
    
    //MARK: - viewDidLayout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bgImageView.frame = view.frame
    }
    
    //MARK: - Add subviews
    private func addSubviews() {
        view.addSubview(bgImageView)
        view.addSubview(topSeparatorView)
        view.addSubview(settingsTable)
    }
    
    //MARK: - Apply constraints
    private func applyConstraints() {
        // topSeparatorView constraints
        let topSeparatorViewConstraints = [
            topSeparatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topSeparatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topSeparatorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topSeparatorView.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        // // settingsTable constraints
        let settingsTableConstraints = [
            settingsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsTable.topAnchor.constraint(equalTo: topSeparatorView.bottomAnchor, constant: 20),
            settingsTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ]
        
        // activate constraints
        NSLayoutConstraint.activate(topSeparatorViewConstraints)
        NSLayoutConstraint.activate(settingsTableConstraints)
    }

    
    //MARK: - Congifure nav bar
    private func configureNavBar() {
        let titleLbl: UILabel = {
            let lbl = UILabel()
            lbl.text = "Налаштування"
            lbl.textColor = .label
            lbl.font = UIFont.systemFont(ofSize: 35, weight: .bold)
            return lbl
        }()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLbl)
        navigationController?.navigationBar.tintColor = .label
    }
}

//MARK: - Lifecycle
extension SettingsVC {
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
}


//MARK: - UITableViewDelegate & DataSource
extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    // apply table delegates
    private func applyTableDelegates() {
        settingsTable.delegate = self
        settingsTable.dataSource = self
    }
    
    // nubers of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    // height for row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // cell for row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.identifier) as? SettingCell else { return UITableViewCell() }
        if indexPath.row == settings.count - 1 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 1000)
        }
        let setting = settings[indexPath.row]
        cell.configure(with: setting)
        return cell
    }
    
    // did select row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellType = settings[indexPath.row].type
        
        switch cellType {
        case .favorite:
            let vc = FavoritesVC()
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            navigationController?.pushViewController(vc, animated: true)
        case .rate:
            print("rate")
        case .thank:
            print("thank")
        }
    }
    
}
