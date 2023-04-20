//
//  TabBarController.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 16.04.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - UI Objects
    private let bottomSpacerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "tableColor")//UIColor(named: "tableColor")//.gray.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let separetorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "separator")//.lightGray.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // bg color
        view.backgroundColor = .systemBackground
        // configure nav bar
        configureTabBar()
        
        let vc1  = UINavigationController(rootViewController: GunVC())
        vc1.tabBarItem.image = UIImage(named: "gunIcon")
        vc1.tabBarItem.imageInsets = UIEdgeInsets(top: 17, left: 17, bottom: 17, right: 17)
        vc1.tabBarItem.title = "Зброя"
        
        let vc2  = UINavigationController(rootViewController: TechniqueVC())
        vc2.tabBarItem.image = UIImage(named: "tecIcon")
        vc2.tabBarItem.imageInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        vc2.tabBarItem.title = "Техніка"
        
        let vc3 = UINavigationController(rootViewController: SearchVC())
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc3.tabBarItem.title = "Пошук"
        
        let vc4 = UINavigationController(rootViewController: SettingsVC())
        vc4.tabBarItem.image = UIImage(systemName: "gearshape")
        vc4.tabBarItem.title = "Налаштування"
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
    
    //MARK: - Configure nav bar
    private func configureTabBar() {
        tabBar.tintColor = .black
        tabBar.addSubview(bottomSpacerView)
        tabBar.addSubview(separetorView)
        applyConstraints()
    }
    
    //MARK: - Apply constraints
    private func applyConstraints() {
        // bottomSeparatorView constraints
        let bottomSeparatorViewConstraints = [
            bottomSpacerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomSpacerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomSpacerView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -10),
            bottomSpacerView.bottomAnchor.constraint(equalTo: tabBar.topAnchor)
        ]
        
        // separetorView constraints
        let separetorViewConstraints = [
            separetorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            separetorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            separetorView.bottomAnchor.constraint(equalTo: bottomSpacerView.topAnchor),
            separetorView.heightAnchor.constraint(equalToConstant: 1)
        ]
        
        // activate constraints
        NSLayoutConstraint.activate(bottomSeparatorViewConstraints)
        NSLayoutConstraint.activate(separetorViewConstraints)
    }


}
