//
//  FullScreenFotoVC.swift
//  VK Client
//
//  Created by mark berkov on 9.02.22.
//

import UIKit

    final class FullScreenFotoVC: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var fotos: Friend?
    var index: Int = 0
    private let swipeGR: UISwipeGestureRecognizer = UISwipeGestureRecognizer()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = fotos?.photoImages[index]
        imageView.isUserInteractionEnabled = true

        let leftGR = UISwipeGestureRecognizer(target: self, action: #selector(didLeftSwipe(_:)))
        leftGR.direction = .left
        imageView.addGestureRecognizer(leftGR)
        
        let rightGR = UISwipeGestureRecognizer(target: self, action: #selector(didRightSwipe(_:)))
        rightGR.direction = .right
        imageView.addGestureRecognizer(rightGR)
        
    }
   
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



extension FullScreenFotoVC {
    @objc func didRightSwipe(_ swipe: UISwipeGestureRecognizer) {

        guard index > 0 else { return }
        
        let newImage = fotos?.photoImages[index - 1]
        
        let newTemporaryImageView = UIImageView()
        newTemporaryImageView.backgroundColor = view.backgroundColor
        newTemporaryImageView.contentMode = .scaleAspectFit
        newTemporaryImageView.image = newImage
       
        newTemporaryImageView.frame = imageView.frame
       
        newTemporaryImageView.frame.origin.x -= imageView.frame.width
        
        view.addSubview(newTemporaryImageView)
       
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: []) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                
                self.imageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.7) {
               
                newTemporaryImageView.frame.origin.x = 0
            }
        } completion: { _ in
            
            self.index -= 1
           
            self.imageView.image = newImage
          
            self.imageView.transform = .identity
            
            newTemporaryImageView.removeFromSuperview()
        }
    }
        

    
    @objc func didLeftSwipe(_ swipe: UISwipeGestureRecognizer) {
        
        guard fotos?.photoImages.count ?? 0 > index + 1 else { return }
        
        let newImage = fotos?.photoImages[index + 1]
        
        let newTemporaryImageView = UIImageView()
        newTemporaryImageView.backgroundColor = view.backgroundColor
        newTemporaryImageView.contentMode = .scaleAspectFit
        newTemporaryImageView.image = newImage
       
        newTemporaryImageView.frame = imageView.frame
       
        newTemporaryImageView.frame.origin.x += imageView.frame.width
        
        view.addSubview(newTemporaryImageView)
       
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: []) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                
                self.imageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.7) {
               
                newTemporaryImageView.frame.origin.x = 0
            }
        } completion: { _ in
            
            self.index += 1
           
            self.imageView.image = newImage
          
            self.imageView.transform = .identity
            
            newTemporaryImageView.removeFromSuperview()
        }
    }
        
}
