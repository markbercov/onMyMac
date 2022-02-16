//
//  CustomSegue.swift
//  VK Client
//
//  Created by mark berkov on 12.02.22.
//

import UIKit

final class CustomSegue: UIStoryboardSegue {
    private let animationTime = 1.5
    
    override func perform() {
        guard let containerView = source.view else { return }
        
        containerView.addSubview(destination.view)
        
        destination.view.frame = containerView.frame
        destination.view.transform = CGAffineTransform(rotationAngle: -90).concatenating(CGAffineTransform(translationX: source.view.bounds.width, y: -source.view.bounds.height))
        

        UIView.animate(withDuration: animationTime) {
            self.destination.view.transform = .identity
        } completion: { _ in
            self.source.present(self.destination, animated: false)
        }
    }
}

