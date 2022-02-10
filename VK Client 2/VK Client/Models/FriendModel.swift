//
//  FriendModel.swift
//  VK Client
//
//  Created by mark berkov on 8.01.22.
//

import UIKit

struct Friend {
    let name: String
    let image: UIImage?
    let photoImages: [UIImage?]
    var countLikes = 0
    init(
        name: String,
        image: UIImage?,
        photoImages: [UIImage]) {
            self.name = name
            self.image = image ?? UIImage(systemName: "figure.wave")
            self.photoImages = photoImages.isEmpty ? [image] : photoImages
        
    }
    
}
 

var allFriend: [Friend] = [
    Friend(name: "dashi", image: UIImage(named: "dashi"), photoImages: [UIImage(named: "1") ?? UIImage(), UIImage(named: "2") ?? UIImage(), UIImage(named: "3") ?? UIImage()]),
    
    Friend(name: "dashi again", image: UIImage(named: "dashi2"), photoImages: []),
    
    Friend(name: "xz", image: nil, photoImages: [])]
