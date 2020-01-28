//
//  SettingsViewController.swift
//  Programmatic-UI
//
//  Created by Kelby Mittan on 1/28/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

struct AppKey {
    static let appColorKey = "app color"
    static let appIndexKey = "app index"
}

class SettingsViewController: UIViewController {

    private let settingsView = SettingsView()
    
    private let colors = ["Red", "Green","Blue", "White"]
    
    override func loadView() {
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsView.pickerView.dataSource = self
        settingsView.pickerView.delegate = self
        
        if let colorName = UserDefaults.standard.object(forKey: AppKey.appColorKey) as? String {
            view.backgroundColor = UIColor(named: colorName)
//            settingsView.pickerView.selectRow(index, inComponent: 1, animated: true)
        }
        if let index = UserDefaults.standard.object(forKey: AppKey.appIndexKey) as? Int {
            print(index)
             settingsView.pickerView.selectRow(index, inComponent: 0, animated: false)
        } else {
            print("found nil")
        }
        
       
        
    }
    
    
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
}

extension SettingsViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let colorName = colors[row]
        view.backgroundColor = UIColor(named: colorName)
        
        UserDefaults.standard.set(colorName, forKey: AppKey.appColorKey)
        UserDefaults.standard.set(row, forKey: AppKey.appIndexKey)
    }
    
    
    
}
