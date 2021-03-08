//
//  AlbumTarget.swift
//  PinchNL
//
//  Created by Andre Nogueira on 03/03/21.
//

import Foundation
import Moya

enum PinchAPI {
    case album(page: Int)
    case photos(albumId: Int, pagination: Int)
}

extension PinchAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "http://testapi.pinch.nl:3000")!
    }
    
    var path: String {
        switch self {
        case .album:
            return "/albums"
        case .photos:
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
        case .photos:
            break
        }
        return Data()
    }
    
    var task: Task {
        if let `parameters` = parameters {
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
        return .requestPlain
    }
    
    var parameters: [String: Any]? {
        switch self {
        
        case .album(let page):
            return ["page": page]
        case .photos(let albumId, let page):
            return ["albumId": albumId, "page": page]
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
