//
//  TabBarController.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 16.04.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // bg color
        view.backgroundColor = .systemBackground
        // configure nav bar
        configureNavBar()
        
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
        
        let vc4 = UINavigationController(rootViewController: InfoVC())
        vc4.tabBarItem.image = UIImage(systemName: "list.bullet.clipboard")
        vc4.tabBarItem.title = "Посібник"
        
        let vc5 = UINavigationController(rootViewController: SettingsVC())
        vc5.tabBarItem.image = UIImage(systemName: "gearshape")
        vc5.tabBarItem.title = "Налаштування"
        
        setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    }
    
    //MARK: - Configure nav bar
    private func configureNavBar() {
        tabBar.tintColor = .label
    }
    


}
