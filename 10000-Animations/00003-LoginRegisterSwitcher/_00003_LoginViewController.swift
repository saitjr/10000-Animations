//
//  _00003_LoginViewController.swift
//  10000-Animations
//
//  Created by saitjr on 11/30/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

protocol _00003_LoginViewControllerDelegate {
    func switchToLogin()
}

class _00003_LoginViewController: UIViewController {
    
    var delegate: _00003_LoginViewControllerDelegate?
    
    fileprivate var loginButton: UIButton!
    
    fileprivate var loginButtonNormalFrame: CGRect {
        return CGRect(x: 0, y: 0, width: 20, height: 40)
    }
    
    fileprivate var loginButtonSelectedFrame: CGRect {
        return CGRect(x: 0, y: 0, width: 20, height: 40)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    func loginButtonTapped() {
        loginButton.isSelected = !loginButton.isSelected
        
    }
}

extension _00003_LoginViewController {
    fileprivate func setupUI() {
        view.backgroundColor = .black
        
        let buttonRect = loginButtonNormalFrame
        loginButton = _00003_UIHelper.generateSwitchButton(frame: buttonRect, title: "Log in", target: self, action: #selector(_00003_LoginViewController.loginButtonTapped))
    }
}
