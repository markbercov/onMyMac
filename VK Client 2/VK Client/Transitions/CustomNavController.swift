//
//  CustomNavController.swift
//  VK Client
//
//  Created by mark berkov on 12.02.22.
//

import UIKit

final class CustomInterTrans: UIPercentDrivenInteractiveTransition {
    var isStarted = false
    var shouldFinish = false
}

final class CustomNavController: UINavigationController, UINavigationControllerDelegate {
    
    private let interTrans = CustomInterTrans()
    private let pushAnimation = PushAnimator()
    private let popAnimation = PopAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        let edgeGR = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgePan(_:)))
        edgeGR.edges = .left
        view.addGestureRecognizer(edgeGR)
    }
    
    @objc
    private func edgePan(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            interTrans.isStarted = true
            popViewController(animated: true)
            
        case .changed:
            guard
                let width = recognizer.view?.bounds.width
            else {
                interTrans.isStarted = false
                interTrans.cancel()
                return
            }
            
            let translation = recognizer.translation(in: view)
            let relativeTranslation = translation.x / width
            let progress = max(0, min(relativeTranslation, 1))
            interTrans.update(progress)
            interTrans.shouldFinish = progress > 0.35
            
        case .ended:
            interTrans.isStarted = false
            interTrans.shouldFinish ? interTrans.finish() : interTrans.cancel()
        case .ended, .cancelled:
            interTrans.isStarted = false
            interTrans.cancel()
        default: break
            
        }
    }
    
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        switch operation {
        case .push:
            return pushAnimation
        case .pop:
            return popAnimation
        default: return nil
        }
       
}
    
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?{
        interTrans.isStarted ? interTrans : nil
    }

}
