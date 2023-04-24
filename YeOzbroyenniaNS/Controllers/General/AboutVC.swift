//
//  AboutVC.swift
//  YeOzbroyenniaNS
//
//  Created by Oleksandr Smakhtin on 24.04.2023.
//

import UIKit

class AboutVC: UIViewController {
    
    //MARK: - Data
    
    
    //MARK: - UI Objects
    private let aboutTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.text = "  єЗброя - додаток, що створений з метою полегшити процес вибору та використання озброєння та техніки військовими. \n\n  Списки зброї та техніки за категоріями та їх характеристики дозволяють знайти потрібний елемент, а функція пошуку за назвою зробить процес ще швидшим та ефективнішим. \n\n  Додаток працює без інтернету, що дозволяє військовим мати доступ до необхідної інформації в будь-який момент. \n\n\n Слава Україні🇺🇦"
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let cornerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "tableColor")
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        view.addSubview(cornerView)
        view.addSubview(aboutTextView)
    }
    
    //MARK: - Apply constraints
    private func applyConstraints() {
        // cornerView constraints
        let cornerViewConstraints = [
            cornerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cornerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cornerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cornerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ]
        
        // aboutTextView constraints
        let aboutTextViewConstraints = [
            aboutTextView.leadingAnchor.constraint(equalTo: cornerView.leadingAnchor, constant: 10),
            aboutTextView.trailingAnchor.constraint(equalTo: cornerView.trailingAnchor, constant: -10),
            aboutTextView.topAnchor.constraint(equalTo: cornerView.topAnchor, constant: 10),
            aboutTextView.bottomAnchor.constraint(equalTo: cornerView.bottomAnchor, constant: -10)
        ]
        
        // activate constrants
        NSLayoutConstraint.activate(cornerViewConstraints)
        NSLayoutConstraint.activate(aboutTextViewConstraints)
    }
    
    //MARK: - Congifure nav bar
    private func configureNavBar() {
        title = "Про додаток"
    }


}

//MARK: - Lifecycle
extension AboutVC {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
}
