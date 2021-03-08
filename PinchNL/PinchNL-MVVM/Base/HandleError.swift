//
//  HandleError.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import Foundation
import Moya

struct ResponseApiError: Decodable {
    let message: String?
    let technicalMessage: String?
}

enum ServiceError: Error {
    case invalidResponse
    case noInternetConnection
    case generic(message: String)
}

extension ServiceError {
    var errorMessage: String {
        switch self {
        case .invalidResponse:
            return "Invalid response from backend."
        case .noInternetConnection:
            return "Theres no internet connection"
        case .generic(let message):
            return message
        }
    }
}

class HandleError {
    
    func handle(with error: Error) -> ServiceError {
        do {
            let response = try getResponseError(with: error)
            switch response.statusCode {
            case 404:
                return .generic(message: "Service not found")
            default: break
            }
            
            if isValidJson(response.data) {
                
                if let jsonError = try? JSONDecoder().decode(ResponseApiError.self, from: response.data) {
                    return .generic(message: jsonError.message ?? "")
                }
                return .generic(message: "There was a data error")
                
            } else {
                let finalError = String(data: response.data, encoding: .utf8)
                    ?? ServiceError.invalidResponse.errorMessage
                return .generic(message: "There was an error")
            }
            
        } catch {
            
            if let error = error as? ServiceError {
                return error
            }
            return .generic(message: "Ops ocorreu um erro")
        }
    }

    private func isValidJson(_ data: Data) -> Bool {
        do {
            _ = try JSONSerialization.jsonObject(with: data, options: [])
            return true
        } catch {
            return false
        }
    }
    
    private func getResponseError(with error: Error) throws -> Response {
        
        if !Reachability.isConnectedToNetwork() {
            throw ServiceError.noInternetConnection
        }
        
        if let error = error as? MoyaError, let response = error.response {
            return response
        }
        
        if let error = error as? ServiceError {
            throw error
        }
        
        throw ServiceError.invalidResponse
    }
}
