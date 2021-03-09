//
//  AlbumRealmObject.swift
//  PinchNL
//
//  Created by Andre Nogueira on 08/03/21.
//

import Foundation
import RealmSwift

class AlbumRealmObject: Object {
    
    @objc dynamic var title = ""
    @objc dynamic var albumId = 0
    @objc dynamic var userId = 0
    @objc dynamic var page = 0
    @objc dynamic var compoundKey = ""

    func setup(title: String, albumId: Int, userId: Int, page: Int) {
        self.title = title
        self.albumId = albumId
        self.userId = userId
        self.page = page
        self.compoundKey = compoundKeyValue()
    }
    override class func primaryKey() -> String? {
        return "compoundKey"
    }
    
    func compoundKeyValue() -> String {
        return "\(title)\(albumId)\(userId)\(page)"
    }
}
