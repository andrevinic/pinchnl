//
//  AlbumModels.swift
//  PinchNL
//
//  Created by Andre Nogueira on 03/03/21.
//

enum AlbumModels {
    
    struct Response {
        var albumList: [(id: Int, title: String)]
    }
    
    struct ViewModel {
        var albumList: [(
            id: String,
            title: String
        )]
    }
    
    struct ViewData {
        let id: String
        let title: String
    }
    
    struct AlbumData {
        let list: [Data]
        struct Data {
            let id: Int
            let userId: Int
            let title: String
        }
    }
    
    struct AlbumError {
        let error: Error
    }
}
