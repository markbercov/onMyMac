//
//  TapsImage.swift
//  VK Client
//
//  Created by mark berkov on 4.02.22.
//

import UIKit

final class TapsImage: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
       // layer.cornerRadius = bounds.width / 2
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.3, delay: 0, options: [.allowUserInteraction]) {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        } completion: { completed in
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.allowUserInteraction]) {
            self.transform = .identity
        
        } completion: { completed in
            
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [.allowUserInteraction]) {
            self.transform = .identity
        
        } completion: { completed in
            
        }
    }
}


