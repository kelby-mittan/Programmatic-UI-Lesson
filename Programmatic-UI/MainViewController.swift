//
//  MainViewController.swift
//  Programmatic-UI
//
//  Created by Kelby Mittan on 1/28/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    // if doing programmatic UI implement and setup the view in view did load
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemTeal
        
        configureNavBar()
        
        // add target
        mainView.resetButton.addTarget(self, action: #selector(resetAppColor(_:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateAppColor()
    }
    
    private func updateAppColor() {
        if let colorName = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String {
            view.backgroundColor = UIColor(named: colorName)
        }
    }
    
    private func configureNavBar() {
        navigationItem.title = "Programmatic UI"
        
        // adding a UIBarButtonItem to the navigation bar
        let barButton = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings(_:)))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc
    private func showSettings(_ sender: UIBarButtonItem) {
        print("show settings")
        
        let settingsVC = SettingsViewController()
        
        //        present(settingsVC, animated: true)
        //        settingsVC.modalTransitionStyle = .partialCurl
        
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    @objc
    private func resetAppColor(_ sender: UIButton) {
        print("reset app color")
    }
    
}
