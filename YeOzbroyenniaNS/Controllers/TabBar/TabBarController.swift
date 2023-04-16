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
        view.backgroundColor = .blue
        
        let vc1  = UINavigationController(rootViewController: GunVC())
        let vc2  = UINavigationController(rootViewController: TechniqueVC())
        let vc3 = UINavigationController(rootViewController: InfoVC())
        let vc4 = UINavigationController(rootViewController: SettingsVC())
        
    }
    


}
