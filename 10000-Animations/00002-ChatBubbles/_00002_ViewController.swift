//
//  CharBubblesViewController.swift
//  10000-Animations
//
//  Created by saitjr on 9/19/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

class _00002_ViewController: UIViewController {
    
    fileprivate var inputTextView: UIView?
    fileprivate var textField: UITextField?
    fileprivate var sendButton: UIButton?
    fileprivate var animateCell: UILabel?
    fileprivate var transitionLayer: CAShapeLayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        setupNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField?.becomeFirstResponder()
    }
    
    internal func sendButtonTapped() {
        guard let textField = textField else {
            return
        }
        let textFieldOrigin = textField.convert(textField.frame.origin, to: view)
        let animateCell = UILabel()
        animateCell.frame = CGRect(x: textField.st.x, y: textFieldOrigin.y - 5, width: 10, height: textField.st.height)
        animateCell.backgroundColor = inputTextView?.backgroundColor
        animateCell.text = textField.text
        animateCell.textColor = textField.tintColor
        animateCell.font = textField.font
        animateCell.frame.size.width = CGFloat(Int(animateCell.st.size().width) + 1)
        view.addSubview(animateCell)
        
        let cellLeftTopConter = animateCell.frame.origin
        let cellRightTopConter = CGPoint(x: animateCell.st.maxX, y: animateCell.st.y)

        let path = UIBezierPath()
        path.move(to: cellLeftTopConter)
        path.addLine(to: cellRightTopConter)
//        path.addLine(to: <#T##CGPoint#>)
        
        let transitionLayer = CAShapeLayer()
        
        
        UIView.animate(withDuration: 5) {
            animateCell.frame = animateCell.frame.offsetBy(dx: 0, dy: -150)
        }
        
        textField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField?.resignFirstResponder()
    }
    
    internal func keyboardWillChangeFrame(notification: NSNotification) {
        let keyboardHeight = notification.st.keyboardHeight
        let keyboardDuration = notification.st.keyboardAnimationDuration
        UIView.animate(withDuration: keyboardDuration) {
            self.inputTextView?.frame.origin.y = self.view.st.height - keyboardHeight - (self.inputTextView?.st.height ?? 0)
        }
    }
    
    internal func keyboardWillHidden(notification: NSNotification) {
        let keyboardDuration = notification.st.keyboardAnimationDuration
        UIView.animate(withDuration: keyboardDuration) { 
            self.inputTextView?.frame.origin.y = self.view.st.height - (self.inputTextView?.st.height ?? 0)
        }
    }
}

extension _00002_ViewController {
    internal func setupUI() {
        view.backgroundColor = .white
        
        let headView = HeadView(frame: CGRect(x: 0, y: 20 + 64, width: 300, height: 50))
        view.addSubview(headView)
        
        let inputTextView = UIView(frame: CGRect(x: 0, y: view.st.height - 50, width: view.st.width, height: 50))
        inputTextView.backgroundColor = UIColor(red: 233.0 / 255.0, green: 234.0 / 255.0, blue: 243.0 / 255.0, alpha: 1)
        view.addSubview(inputTextView)
        self.inputTextView = inputTextView
        
        let sendButton = UIButton()
        sendButton.frame = CGRect(x: inputTextView.st.width - 30 - 20, y: 0, width: 30, height: 30)
        sendButton.center.y = inputTextView.st.halfHeight
        sendButton.setImage(UIImage(named: "CharBubblesViewController-send"), for: .normal)
        sendButton.layer.cornerRadius = sendButton.st.halfHeight
        sendButton.backgroundColor = UIColor(red: 143.0 / 255.0, green: 135.0 / 255.0, blue: 252.0 / 255.0, alpha: 1)
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        inputTextView.addSubview(sendButton)
        
        let textField = UITextField(frame: CGRect(x: 20, y: 5, width: sendButton.st.x - 40, height: 40))
        textField.autocorrectionType = .no
        textField.keyboardAppearance = .dark
        textField.returnKeyType = .send
        textField.autocapitalizationType = .none
        textField.placeholder = "Your Message"
        textField.tintColor = UIColor(red: 37.0 / 255.0, green: 39.0 / 255.0, blue: 67.0 / 255.0, alpha: 1)
        inputTextView.addSubview(textField)
        self.textField = textField
    }
    
    internal func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(notification:)), name: .UIKeyboardWillChangeFrame, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHidden(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
}

extension _00002_ViewController {
//    internal func gener
}

class HeadView: UIView {
    fileprivate let avatarImageView: UIImageView
    fileprivate let nameLabel: UILabel
    fileprivate let descriptionLabel: UILabel
    
    override init(frame: CGRect) {
        avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "CharBubblesViewController-Avatar.jpg")
        
        nameLabel = UILabel()
        nameLabel.text = "Jakub Antalík"
        nameLabel.font = .systemFont(ofSize: 20)
        
        descriptionLabel = UILabel()
        descriptionLabel.text = "Product Designer"
        descriptionLabel.font = UIFont(name: ProjectConfig.lightFontName, size: 15)
        
        super.init(frame: frame)
        
        avatarImageView.frame = CGRect(x: 20, y: 0, width: 40, height: 40)
        avatarImageView.center.y = st.halfHeight
        avatarImageView.layer.cornerRadius = avatarImageView.st.halfHeight
        avatarImageView.layer.masksToBounds = true
        
        nameLabel.frame = CGRect(x: avatarImageView.st.maxX + 10, y: avatarImageView.st.y, width: 200, height: 20)
        descriptionLabel.frame = nameLabel.frame.offsetBy(dx: 0, dy: 20)
        
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
