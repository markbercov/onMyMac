//
//  TestVC.swift
//  VK Client
//
//  Created by mark berkov on 4.02.22.
//

import UIKit

class TestVC: UIViewController {

    @IBOutlet var testImage: UIImageView!
    
    @IBOutlet var leftC: NSLayoutConstraint!
    
    @IBAction func tap(_ sender: Any) {
       animate0()
        animateLoad()

    }
    
    @IBOutlet var cir3: UIImageView!
    @IBOutlet var cir2: UIImageView!
    @IBOutlet var cir1: UIImageView!
    
    func animateLoad() {
        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse, .repeat]) {
            self.cir1.tintColor = UIColor.white
        }
        UIView.animate(withDuration: 1, delay: 0.3, options: [.autoreverse, .repeat]) {
            self.cir2.tintColor = UIColor.white
        }
        UIView.animate(withDuration: 1, delay: 0.6, options: [.autoreverse, .repeat]) {
            self.cir3.tintColor = UIColor.white
       } //completion: { <#Bool#> in
//            <#code#>
//        }

    }
    
    func animate0() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, delay: 0.5, options: [.transitionCurlDown, .autoreverse]) {
            self.leftC.isActive = false
            self.view.layoutIfNeeded()

        } completion: { isComplete in
            self.leftC.isActive = true
        }
    }
    func animate1() {
        UIView.transition(with: testImage, duration: 1, options: [.transitionCurlDown, .autoreverse]) {
            self.testImage.image = UIImage(named: "2")
        } completion: { isComplete in
            self.testImage.image = UIImage(named: "1")
        }

    }
    
    func animate2() {
        CATransaction.begin()
        
        CATransaction.setCompletionBlock {
            self.testImage.frame.origin.x += 150
        }
        
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.beginTime = CACurrentMediaTime() + 0.5
        animation.fromValue = testImage.layer.position.x
        animation.toValue = testImage.layer.position.x + 150
        animation.duration = 1
        testImage.layer.add(animation, forKey: nil)
        CATransaction.commit()
    }
    
    func animate3() {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.4,
                       options: .transitionCrossDissolve) {
            self.testImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
        } completion: { _ in
            self.testImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            //self.testImage.transform = .identity
        }

    }
    
    func animate4() {
        
    }
}

