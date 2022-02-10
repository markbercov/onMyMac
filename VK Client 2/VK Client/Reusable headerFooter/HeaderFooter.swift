//
//  HeaderFooter.swift
//  VK Client
//
//  Created by mark berkov on 26.01.22.
//

import UIKit

class HeaderFooter: UITableViewHeaderFooterView {

    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = "eto text коко"
        //textLabel?.textColor = .red
        detailTextLabel?.text = "i eto to"
    }

}
