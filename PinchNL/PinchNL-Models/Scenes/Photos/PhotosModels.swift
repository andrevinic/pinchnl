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
  
    struct Request {
        
    }
    
    struct ViewModel {
        let title: String
        let url: String
        let thumbnailUrl: String
    }
    
    
    struct PhotosData {
        
    }
    
}
