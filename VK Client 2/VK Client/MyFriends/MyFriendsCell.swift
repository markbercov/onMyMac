//
//  MyFriendsCell.swift
//  VK Client
//
//  Created by mark berkov on 27.12.21.
//

import UIKit

final class MyFriendsCell: UITableViewCell {

    @IBOutlet var friendsImage: UIImageView!
    
    @IBOutlet var friendsName: UILabel!
    
    func configure(image: UIImage, name: String) {
        friendsName.text = name
        friendsImage.image = image
    }
    
}
