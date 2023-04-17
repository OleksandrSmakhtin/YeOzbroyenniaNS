//
//  GunVC.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 16.04.2023.
//

import UIKit

class GunVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // bg color
        view.backgroundColor = .systemBackground
        // configure nav bar
        configureNavBar()
        
    }
    
    
    //MARK: - Congifure nav bar
    private func configureNavBar() {
        title = "Зброя"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    

}
