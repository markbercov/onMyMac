//
//  FullScreenFotoVC.swift
//  VK Client
//
//  Created by mark berkov on 9.02.22.
//

import UIKit

class FullScreenFotoVC: UIViewController {

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
//        guard index >= 0,
//              index < (fotos?.photoImages.count)!
//        else { return }
//
//        imageView.image = fotos?.photoImages[index - 1]
       // index -= 1
        print("r")
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .calculationModeCubicPaced) {
            guard self.index >= 0,
                  self.index < (self.fotos?.photoImages.count)!
            else { return }
            self.imageView.image = self.fotos?.photoImages[self.index - 1]
            self.index -= 1
        }

    }
    
    @objc func didLeftSwipe(_ swipe: UISwipeGestureRecognizer) {
        guard index >= 0,
              index < (fotos?.photoImages.count)!
        else { return }
        imageView.image = fotos?.photoImages[index + 1]
        index += 1
        print("l")
        
    }
}
