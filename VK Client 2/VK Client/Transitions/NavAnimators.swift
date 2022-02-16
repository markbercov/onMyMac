//
//  NavAnimators.swift
//  VK Client
//
//  Created by mark berkov on 12.02.22.
//

import UIKit

final class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let animationTime = 1.5
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        animationTime
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let source = transitionContext.viewController(forKey: .from),
            let destination = transitionContext.viewController(forKey: .to)
        else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.frame = transitionContext.containerView.frame
        destination.view.transform = CGAffineTransform(rotationAngle: -90).concatenating(CGAffineTransform(translationX: source.view.bounds.width, y: -source.view.bounds.height))
        
        
        UIView.animateKeyframes(withDuration: animationTime, delay: 0.0, options: .calculationModeCubicPaced) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.75) {
                //let translations = CGAffineTransform.identity
                destination.view.transform = .identity
            }
        } completion: { isComplete in
            if isComplete && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(isComplete && !transitionContext.transitionWasCancelled)
        }

    }
    
    
}


final class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let animationTime = 1.5
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        animationTime
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let source = transitionContext.viewController(forKey: .from),
            let destination = transitionContext.viewController(forKey: .to)
        else { return }
        
        //transitionContext.containerView.insertSubview(destination.view, belowSubview: source.view)
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = transitionContext.containerView.frame
        destination.view.transform = CGAffineTransform(rotationAngle: 90).concatenating(CGAffineTransform(translationX: -source.view.bounds.width, y: -source.view.bounds.height))
//        transitionContext.containerView.addSubview(destination.view)
//        destination.view.bounds.origin = transitionContext.containerView.bounds.x
        
        UIView.animateKeyframes(withDuration: animationTime, delay: 0.0, options: .calculationModeCubicPaced) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.75) {
                //let translations = CGAffineTransform.identity
                destination.view.transform = .identity
            }
        } completion: { isComplete in
            if isComplete && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(isComplete && !transitionContext.transitionWasCancelled)
        }

    }
    
    
}
