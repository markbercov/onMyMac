//
//  AllPeopleCollectionCell.swift
//  VK Client
//
//  Created by mark berkov on 29.12.21.
//

import UIKit

final class FriendProfileCollectionCell: UICollectionViewCell {

    @IBOutlet var friendImage: UIImageView!
    @IBOutlet var botLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var countLikesLabel: UILabel!
    
    
    var count = 0
    
   
    
//    var gestureOn = UITapGestureRecognizer(target: self.friendImage, action: #selector(animateTitleAppearing))
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(systemName: "heart.fill") {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
            count -= 1
            iii()
        } else {
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            count += 1
            iii()
//            animateTitleAppearing()
        }
        
        
    }
    
    
    
    func configure(image: UIImage?, bot: String) {
       
        
        self.friendImage.image = image
        self.botLabel.text = bot
    }
    

    
    private func animatecountLikesLabel() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 1.5
        animation.duration = 1
        //animation.beginTime = CACurrentMediaTime()
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.countLikesLabel.layer.add(animation, forKey: nil)
    }
    
    private func iii() {
        UIView.transition(with: countLikesLabel, duration: 1, options: .transitionFlipFromTop, animations: {
            self.countLikesLabel.text = String(self.count)
            
        })
    }
    
    func animateTitleAppearing() {
        self.friendImage?.transform = CGAffineTransform(translationX: 0,
                                                     y: -self.friendImage.bounds.height/2)
        
        UIView.animate(withDuration: 1,
                       delay: 1,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
                           self.friendImage?.transform = .identity
        },
                       completion: nil)
    }
    
   
    
}


