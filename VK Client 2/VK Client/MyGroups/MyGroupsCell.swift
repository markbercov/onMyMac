//
//  MyGroupsCell.swift
//  VK Client
//
//  Created by mark berkov on 27.12.21.
//

import UIKit

final class MyGroupsCell: UITableViewCell {

    @IBOutlet var groupImage: UIImageView!
    
    @IBOutlet var groupName: UILabel!
    
    
    func configure(image: UIImage, name: String) {
        groupName.text = name
        groupImage.image = image
    }
}
