//
//  RealmManager.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 08/03/21.
//

import UIKit
import RealmSwift

protocol RealmManagerContract {
    func storeAlbumModels(response: [AlbumResponse], page: Int)
    func getAlbumModels(page: Int) -> [AlbumResponse]
}
class RealmManager: RealmManagerContract {
    
    private lazy var realm: Realm = {
        let realm = try! Realm()
        return realm
    }()
    
    func storeAlbumModels(response: [AlbumResponse], page: Int) {
        response.forEach { [weak self] in
            let albumObject = AlbumRealmObject()
            albumObject.setup(
                title: $0.title,
                albumId: $0.id,
                userId: $0.userId,
                page: page
            )
            
            try! realm.write {
                self?.realm.add(albumObject, update: .all)
            }
        }
    }
    
    func getAlbumModels(page: Int) -> [AlbumResponse] {
        var albumList:[AlbumResponse] = []
        let albumObjects = self.realm.objects(AlbumRealmObject.self)
        albumObjects.forEach {
            
            let model = AlbumResponse(
                id: $0.albumId,
                title: $0.title,
                userId: $0.userId
            )
            albumList.append(model)
        }
        return albumList
    }

}
