//
//  User.swift
//  Task4
//
//  Created by Admin on 12/24/20.
//

import Foundation

struct User {
    
    var name: String
    var videosCount: Int
    var heartsCount: Int
    var gamesCount: Int
    var winsCount: Int
    
    init(name: String) {
        self.name = name
        videosCount = (0...100000).randomElement()!
        heartsCount = (0...100000).randomElement()!
        gamesCount = (0...100000).randomElement()!
        winsCount = (0...100000).randomElement()!
    }
}
