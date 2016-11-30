//
//  ParallaxEffectViewController.swift
//  10000-Animations
//
//  Created by saitjr on 9/16/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit
import CoreMotion

class _00001_ViewController: UIViewController {
    
    fileprivate var motionManager: CMMotionManager?
    fileprivate var motionView: UIView?
    fileprivate var label: UILabel?
    fileprivate var motionCenter: CGPoint = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        setupMotionView()
        setupMotion()
    }
}

extension _00001_ViewController {
    internal func setupMotion() {
        let motionManager = CMMotionManager()
        motionManager.gyroUpdateInterval = 1
        
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.2
            
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { [weak self] (motion, error) in
                guard let motion = motion, let existSelf = self, let motionView = existSelf.motionView else {
                    return
                }
                let factor: CGFloat = 50
                let x: CGFloat = CGFloat(motion.gravity.x) * factor
                let y: CGFloat = CGFloat(motion.gravity.y) * -factor
                
                motionView.center = CGPoint(x: existSelf.motionCenter.x + x, y: existSelf.motionCenter.y + y)
            }
        }
        self.motionManager = motionManager
    }
    
    internal func setupUI() {
        let backgroundImage = UIImage(named: "ParallaxEffectViewController")
        view.backgroundColor = UIColor(patternImage: backgroundImage!)
    }
    
    internal func setupMotionView() {
        let screenShot = view.st.toImage()
        
        let maskView = UIImageView(image: screenShot)
        maskView.frame = view.bounds
        view.addSubview(maskView)
        motionCenter = maskView.center
        self.motionView = maskView

        // label
        let label = UILabel()
        label.text = "HOLO !"
        label.font = .systemFont(ofSize: 40, weight: 20)
        label.textColor = .red
        label.bounds.size = label.st.size()
        label.center = maskView.center
        self.label = label
        
        maskView.addSubview(label)
        maskView.layer.mask = label.layer
    }
}
