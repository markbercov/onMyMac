//
//  AllGroupsCell.swift
//  VK Client
//
//  Created by mark berkov on 27.12.21.
//

import UIKit

class AllGroupsCell: UITableViewCell {

    @IBOutlet var groupImage: AvatarImage!
    
   
    @IBOutlet var groupName: UILabel!
    
    @IBOutlet var statusLabel: UILabel!
    
    func configure(image: UIImage, name: String, status: Bool) {
        
        groupName.text = name
        
        groupImage.image = image
        
        
        if status {
            statusLabel.text = "You're in a group"
        } else {
            statusLabel.text = ""
        }
    }
    
}
