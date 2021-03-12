//
//  AlbumResponse.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 03/03/21.
//

import Foundation

struct AlbumResponse: Codable {
    let userId: Int
    let id: Int
    let title: String
    
    init(id: Int, title: String, userId: Int) {
        self.id = id
        self.title = title
        self.userId = userId
    }
}
