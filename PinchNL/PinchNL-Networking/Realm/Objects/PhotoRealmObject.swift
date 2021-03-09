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
}
