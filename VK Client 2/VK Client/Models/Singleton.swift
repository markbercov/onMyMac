//
//  Singleton.swift
//  VK Client
//
//  Created by mark berkov on 16.02.22.
//



final class Singleton {
    var token = ""
    var userId = 0
    
    static let instance = Singleton()
    
    private init(){ }
}
