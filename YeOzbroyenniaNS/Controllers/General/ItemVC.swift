//
//  ItemVC.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 18.04.2023.
//

import UIKit

class ItemVC: UIViewController {
    
    //MARK: - Tracker
    private var isItemExists: Bool?
    
    //MARK: - Data
    public var item = Item(item: "", property: [Property]())
        
    //MARK: - UI Objects
    private let topSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let itemTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .label
        lbl.numberOfLines = 2
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let circleContentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor(named: "tableColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let itemTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.layer.cornerRadius = 5
        table.register(ItemCell.self, forCellReuseIdentifier: ItemCell.identifier)
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
        // chech item
        isItemExists = CoreDataManager.shared.isItemExists(with: item.item)
        // configure nav bar
        configureNavBar()
        // add subviews
        addSubviews()
        // apply constraints
        applyConstraints()
        // apply delegates
        applyTableDelegates()
        // set title
        itemTitle.text = item.item
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
        view.addSubview(circleContentView)
        view.addSubview(itemTitle)
        view.addSubview(underlineView)
        circleContentView.addSubview(itemTable)
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
        
        // circleContentView constraints
        let circleContentViewConstraints = [
            circleContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            circleContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            circleContentView.topAnchor.constraint(equalTo: topSeparatorView.bottomAnchor, constant: 100),
            circleContentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        // itemTitle constraints
        let itemTitleConstraints = [
            itemTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            itemTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            itemTitle.bottomAnchor.constraint(equalTo: circleContentView.topAnchor, constant: -40)
        ]
        
        // underlineView constraints
        let underlineViewConstraints = [
            underlineView.heightAnchor.constraint(equalToConstant: 1),
            underlineView.topAnchor.constraint(equalTo: itemTitle.bottomAnchor, constant: 15),
            underlineView.widthAnchor.constraint(equalToConstant: 100),
            underlineView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        // itemTable constraints
        let itemTableConstraints = [
            itemTable.leadingAnchor.constraint(equalTo: circleContentView.leadingAnchor, constant: 10),
            itemTable.trailingAnchor.constraint(equalTo: circleContentView.trailingAnchor, constant: -10),
            itemTable.topAnchor.constraint(equalTo: circleContentView.topAnchor, constant: 10),
            itemTable.bottomAnchor.constraint(equalTo: circleContentView.bottomAnchor)
        ]
        
        // activate constraints
        NSLayoutConstraint.activate(topSeparatorViewConstraints)
        NSLayoutConstraint.activate(circleContentViewConstraints)
        NSLayoutConstraint.activate(itemTitleConstraints)
        NSLayoutConstraint.activate(underlineViewConstraints)
        NSLayoutConstraint.activate(itemTableConstraints)
    }
    
    //MARK: - Configure nav bar
    private func configureNavBar() {
        if isItemExists! {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(addOrDeleteFavoritesAction))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(addOrDeleteFavoritesAction))
        }
    }
    
    //MARK: - Action
    @objc private func addOrDeleteFavoritesAction() {
        
        let itemActualStatus = CoreDataManager.shared.isItemExists(with: item.item)
        
        if itemActualStatus {
            print("Item exists. Deleting...")
            CoreDataManager.shared.deleteItem(with: item.item)
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart")
        } else {
            print("Item does not exist. Saving...")
            CoreDataManager.shared.addItem(with: item.item)
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart.fill")
        }
    }

}

//MARK: - Lifecycle
extension ItemVC {
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        
        isItemExists = CoreDataManager.shared.isItemExists(with: item.item)
        print("Item exists?: \(isItemExists)")
    }
}


//MARK: - UITableViewDelegate & DataSource
extension ItemVC: UITableViewDelegate, UITableViewDataSource {
    // apply table delegates
    private func applyTableDelegates() {
        itemTable.delegate = self
        itemTable.dataSource = self
    }
    
    // nubers of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.property.count
    }
    
    // cell for row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier) as? ItemCell else { return UITableViewCell() }
        let properties = item.property
        cell.configure(with: properties[indexPath.row].name, value: properties[indexPath.row].value)
        return cell
    }
}
