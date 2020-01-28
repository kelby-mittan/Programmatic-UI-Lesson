//
//  ViewController.swift
//  Programmatic-UI
//
//  Created by Kelby Mittan on 1/28/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemTeal
        
        configureNavBar()
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
    }

}

