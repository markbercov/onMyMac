//
//  CollectionReusableView.swift
//  VK Client
//
//  Created by mark berkov on 27.01.22.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {

    
    @IBOutlet var headerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func configure(_ img: UIImage) {
       // headerImage.image = UIImage(named: "dashi")
    }
    
}
