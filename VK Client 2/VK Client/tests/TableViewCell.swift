//
//  TableViewCell.swift
//  VK Client
//
//  Created by mark berkov on 21.01.22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var imagexu: UIImageView!
    
    @IBOutlet var labelxu: UILabel!
    
    @IBOutlet var labelxu2: UILabel!
    
    
    func config(img: UIImage, l1: String, l2: Bool) {
        
        self.imagexu.image = img 
        self.labelxu.text = l1
        //self.labelxu2.text = l2
        
        if l2 {
            self.labelxu2.text = "privet pidor"
        } else {
            self.labelxu2.text = ""
        }
        
    }
    
}
