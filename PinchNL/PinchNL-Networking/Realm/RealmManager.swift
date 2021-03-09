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
    func storePhotosModels(response: [PhotoResponse])
    func getPhotosModels(requestService: PhotosModels.RequestService.Photos) -> [PhotoResponse]
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
    
    func storePhotosModels(response: [PhotoResponse]) {
        response.forEach { [weak self] in
            let photoObject = PhotoRealmObject()
            photoObject.setup(
                title: $0.title,
                id: $0.id,
                albumId: $0.albumId
            )
            try! realm.write { [weak self] in
                self?.realm.add(photoObject, update: .all)
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
    
    func getPhotosModels(requestService: PhotosModels.RequestService.Photos) -> [PhotoResponse] {
        var photoList:[PhotoResponse] = []
        let photosObjects = self.realm
            .objects(PhotoRealmObject.self)
            .filter("albumId == \(requestService.albumId)")
        
        photosObjects.forEach {
            
            let model = PhotoResponse(
                albumId: $0.albumId,
                id: $0.id,
                title: $0.title,
                url: "",
                thumbnailUrl: ""
            )
            photoList.append(model)
        }
        
        return photoList
    }
}
