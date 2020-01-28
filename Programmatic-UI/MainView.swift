//
//  MainView.swift
//  Programmatic-UI
//
//  Created by Kelby Mittan on 1/28/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let defaultMessage = "No default color set. Please go to settings"
    
    public lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = defaultMessage
        label.backgroundColor = .systemYellow
        label.textAlignment = .center
        return label
    }()
    
    public lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("reset", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        setupMessageLabel()
        setupResetButtonConstraints()
    }
    
    private func setupMessageLabel() {
        // add message label to the main view
        addSubview(messageLabel) // returns the message label we created above
        
        // set constraints for the messageLabel
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // set top anchor to 20 points from the safe area
            messageLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            // set padding at the leading edge of the MainView
            messageLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            // set padding at the trailing edge of the MainView
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setupResetButtonConstraints() {
        addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            resetButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 40)
        ])
        
    }
}
