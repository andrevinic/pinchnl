//
//  PhotoResponse.swift
//  PinchNL
//
//  Created by Andre Nogueira on 03/03/21.
//

import Foundation

struct PhotoResponse: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    
    init(
        albumId: Int,
        id: Int,
        title: String,
        url: String,
        thumbnailUrl: String
    ) {
        self.albumId = albumId
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
}
