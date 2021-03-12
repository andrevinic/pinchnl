//
//  PhotoRealmObject.swift
//  PinchNL
//
//  Created by Andre Nogueira on 08/03/21.
//

import Foundation
import RealmSwift

class PhotoRealmObject: Object {
    
    @objc dynamic var title = ""
    @objc dynamic var id = 0
    @objc dynamic var albumId = 0
    @objc dynamic var compoundKey = ""
    
    override class func primaryKey() -> String? {
        return "compoundKey"
    }
    
    func setup(title: String, id: Int, albumId: Int) {
        self.title = title
        self.id = id
        self.albumId = albumId
        self.compoundKey = compoundKeyValue()
    }
    
    func compoundKeyValue() -> String {
        return "\(id)\(albumId)"
    }
}
