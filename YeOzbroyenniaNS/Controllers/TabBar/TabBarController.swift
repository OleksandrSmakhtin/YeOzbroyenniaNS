//
//  TabBarController.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 16.04.2023.
//


import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - Tracker
    private var selectedTab = 0 {
        didSet {
            for i in 0...3 {
                
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) { [weak self] in
                    self?.centerXAnchorsForIndicator[i].isActive = i == self?.selectedTab ? true : false
                    self?.tabBar.layoutIfNeeded()
                } completion: { _ in }

                
            }
        }
    }
    
    //MARK: - Array of constraints for indicator
    private var centerXAnchorsForIndicator: [NSLayoutConstraint] = []
    private var topAnchorsForIndicator: [NSLayoutConstraint] = []
    
    //MARK: - UI Objects
    var indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.7)
        view.layer.cornerRadius = 2.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // bg color
        view.backgroundColor = .systemBackground
        // configure nav bar
          //configureTabBar()
        // set controllers
        let vc1  = UINavigationController(rootViewController: GunVC())
        vc1.tabBarItem.image = UIImage(named: "gun")
        vc1.tabBarItem.selectedImage = UIImage(named: "gunFill")
        vc1.tabBarItem.imageInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        vc1.tabBarItem.title = "Зброя"
        
        let vc2  = UINavigationController(rootViewController: TechniqueVC())
        vc2.tabBarItem.image = UIImage(named: "teq")
        vc2.tabBarItem.selectedImage = UIImage(named: "teqFill")
        vc2.tabBarItem.imageInsets = UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14)
        vc2.tabBarItem.title = "Техніка"
        
        let vc3 = UINavigationController(rootViewController: SearchVC())
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        vc3.tabBarItem.title = "Пошук"
        
        let vc4 = UINavigationController(rootViewController: SettingsVC())
        vc4.tabBarItem.image = UIImage(systemName: "gearshape")
        vc4.tabBarItem.selectedImage = UIImage(systemName: "gearshape.fill")
        vc4.tabBarItem.title = "Налаштування"

        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        configureTabBar()
    }
    
    //MARK: - Configure nav bar
    private func configureTabBar() {
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .clear.withAlphaComponent(0.5)
        tabBar.addSubview(indicatorView)
        applyConstraints()
    }
    
    //MARK: - Apply constraints
    private func applyConstraints() {
        // get indicator constraints
        for (index, item) in tabBar.subviews.enumerated() {
            if index == tabBar.subviews.count - 1 {
                continue
            }
            let centerXAnchor = indicatorView.centerXAnchor.constraint(equalTo: item.centerXAnchor)
            centerXAnchorsForIndicator.append(centerXAnchor)
            let topAnchor = indicatorView.topAnchor.constraint(equalTo: item.bottomAnchor, constant: 5)
            topAnchorsForIndicator.append(topAnchor)
        }
        
        // indicatorView constraints
        let indicatorViewConstraints = [
            centerXAnchorsForIndicator[0],
            topAnchorsForIndicator[0],
            indicatorView.heightAnchor.constraint(equalToConstant: 5),
            indicatorView.widthAnchor.constraint(equalToConstant: 5)
        ]
        
        // activate constraints
        NSLayoutConstraint.activate(indicatorViewConstraints)
    }

    
    //MARK: - Did select item
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // animation
        if let index = tabBar.items?.firstIndex(of: item) {
            animateToTab(toIndex: index)
        }
        
        // indicator changes
        switch item.title {
        case "Зброя":
            selectedTab = 0
        case "Техніка":
            selectedTab = 1
        case "Пошук":
            selectedTab = 2
        case "Налаштування":
            selectedTab = 3
        default:
            selectedTab = 0
        }
    }
    
    //MARK: - Transition animation
    func animateToTab(toIndex: Int) {
        guard let fromView = selectedViewController?.view, let toView = viewControllers?[toIndex].view, fromView != toView else {return}
        UIView.transition(from: fromView, to: toView, duration: 0.2, options: [.transitionCrossDissolve], completion: nil)
    }
}

