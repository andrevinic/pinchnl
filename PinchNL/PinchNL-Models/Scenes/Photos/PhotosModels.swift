//
//  PhotosModels.swift
//  PinchNL
//
//  Created by Andre Nogueira on 08/03/21.
//

import Foundation

enum PhotosModels {
    
    enum RequestService {
        struct Photos {
            let page: Int
            let albumId: Int
        }
    }
    
    struct Response {
        let list: [(title: String, url: String, thumbnailUrl: String)]
    }
    
    struct ViewModel {
        var list: [(title: String, url: String, thumbnailUrl: String)]
    }
    
    struct ViewData {
        let title: String
        let url: String
        let thumbnailUrl: String
    }
    
    struct PhotosData {
        let data: [Data]
        
        struct Data {
            let title: String
            let url: String
            let thumbnailUrl: String
        }
       
    }
    
    struct PhotosError {
        let error: Error
    }
}
