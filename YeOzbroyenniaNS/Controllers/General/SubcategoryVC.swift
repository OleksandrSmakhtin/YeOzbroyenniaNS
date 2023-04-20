//
//  SubcategoryVC.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 18.04.2023.
//

import UIKit

class SubcategoryVC: UIViewController {
    
    //MARK: - Data
    public var subcategory = Subcategory(category: "", subcategories: [""])
    
    //MARK: - UI Objects
    private let topSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let listTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white.withAlphaComponent(0.4)
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
        configureNavBar(with: subcategory.category)
        // add subviews
        addSubviews()
        // apply constraints
        applyConstraints()
        // apply delegates
        applyTableDelegates()
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
    
    
    //MARK: - Congifure nav bar
    public func configureNavBar(with title: String) {
        self.title = title
        navigationController?.navigationBar.tintColor = .label
    }
    
}

//MARK: - Lifecycle
extension SubcategoryVC {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
}



//MARK: - UITableViewDelegate & DataSource
extension SubcategoryVC: UITableViewDelegate, UITableViewDataSource {
    // apply table delegates
    private func applyTableDelegates() {
        listTable.delegate = self
        listTable.dataSource = self
    }
    
    // nubers of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subcategory.subcategories.count
    }
    
    // cell for row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier) as? ListCell else { return UITableViewCell() }
        cell.configure(with: subcategory.subcategories[indexPath.row])
        return cell
    }
    
    // height for row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // did select row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = subcategory.subcategories[indexPath.row]
        let element = DataManager.shared.getElements(by: model)
        
        let vc = ElementVC()
        vc.element = element
        navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
