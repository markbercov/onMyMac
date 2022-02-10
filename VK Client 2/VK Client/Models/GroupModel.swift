//
//  GroupModel.swift
//  VK Client
//
//  Created by mark berkov on 8.01.22.
//

import Foundation
import UIKit

struct AllGroups: Comparable {
    static func < (lhs: AllGroups, rhs: AllGroups) -> Bool {
        lhs.name < rhs.name
    }
    
    private static var count = 0
    
    let name: String
    let image: UIImage?
    var status: Bool
    //var id: Int
    
    init(name: String, image: UIImage?, status: Bool) {
        self.name = name
        self.image = image ?? UIImage(systemName: "brain.head.profile")
        self.status = status
    }
    
}



extension AllGroups: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name
    }
}
