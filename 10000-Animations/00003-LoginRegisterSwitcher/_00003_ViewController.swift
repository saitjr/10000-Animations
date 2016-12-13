//
//  _00003_ViewController.swift
//  10000-Animations
//
//  Created by saitjr on 11/30/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

fileprivate struct Config {
    static let switchWidth: CGFloat = 60
    static let switchVCAnimationDuration: TimeInterval = 0.5
}

class _00003_ViewController: UIViewController {
    
    fileprivate var loginVC: _00003_LoginViewController!
    fileprivate var registerVC: _00003_RegisterViewController!
    
    fileprivate var closeButton: UIButton!
    
    fileprivate var loginButton: UIButton!
    fileprivate var registerButton: UIButton!
    
    fileprivate var isLoginShown: Bool = true
    
    fileprivate var leftShowRect: CGRect {
        return CGRect(x: CGFloat(0), y: CGFloat(0), width: st.screenWidth() - Config.switchWidth, height: st.screenHeight())
    }
    fileprivate var leftHideRect: CGRect {
        return CGRect(x: -st.screenWidth() + 2 * Config.switchWidth, y: CGFloat(0), width: st.screenWidth() - Config.switchWidth, height: st.screenHeight())
    }
    fileprivate var rightShowRect: CGRect {
        return CGRect(x: Config.switchWidth, y: CGFloat(0), width: st.screenWidth() - Config.switchWidth, height: st.screenHeight())
    }
    fileprivate var rightHideRect: CGRect {
        return CGRect(x: st.screenWidth() - Config.switchWidth, y: CGFloat(0), width: st.screenWidth() - Config.switchWidth, height: st.screenHeight())
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func tapGesture(sender: UITapGestureRecognizer) {
        let position = sender.location(in: view)
        
        if (isLoginShown && position.x > st.screenWidth() - Config.switchWidth) ||
           (!isLoginShown && position.x < Config.switchWidth) {
            switchAnimation()
        }
    }
}

extension _00003_ViewController {
    fileprivate func setupUI() {
        view.backgroundColor = .white

        loginVC = _00003_LoginViewController()
        loginVC.view.frame = leftShowRect
        view.addSubview(loginVC.view)
        
        registerVC = _00003_RegisterViewController()
        registerVC.view.frame = rightHideRect
        view.addSubview(registerVC.view)
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(_00003_ViewController.tapGesture(sender:)))
//        view.addGestureRecognizer(tapGesture)
    }
}

extension _00003_ViewController {
    fileprivate func switchAnimation() {
        if isLoginShown {
            UIView.animate(withDuration: Config.switchVCAnimationDuration, animations: { 
                self.loginVC.view.frame = self.leftHideRect
                self.registerVC.view.frame = self.rightShowRect
            })
        } else {
            UIView.animate(withDuration: Config.switchVCAnimationDuration, animations: {
                self.loginVC.view.frame = self.leftShowRect
                self.registerVC.view.frame = self.rightHideRect
            })
        }
        isLoginShown = !isLoginShown
    }
}
