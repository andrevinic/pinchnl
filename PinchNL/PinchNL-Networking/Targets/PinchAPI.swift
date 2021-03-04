//
//  AlbumTarget.swift
//  PinchNL
//
//  Created by Andre Nogueira on 03/03/21.
//

import Foundation
import Moya

enum PinchAPI {
    case album
    case photo(albumId: Int, pagination: Int)
}

extension PinchAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "http://testapi.pinch.nl:3000")!
    }
    
    var path: String {
        switch self {
        case .album:
            return "/albums"
        case .photo:
            return "/photos"
        }
    }
    
    var method: Moya.Method {
        return Method.get
    }
    
    var sampleData: Data {
        switch self {
        case .album:
            break
        case .photo:
            break
        }
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
