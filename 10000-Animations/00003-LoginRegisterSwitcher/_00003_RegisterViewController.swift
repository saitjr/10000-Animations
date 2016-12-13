//
//  _00003_RegisterViewController.swift
//  10000-Animations
//
//  Created by saitjr on 11/30/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

protocol _00003_RegisterViewControllerDelegate {
    func switchToRegister()
}

class _00003_RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
    }
}

extension _00003_RegisterViewController {
    fileprivate func setupUI() {
        view.backgroundColor = .red
    }
}
