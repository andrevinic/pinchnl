//
//  Single+Extension.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//
import RxSwift
import RxCocoa
import Foundation
import Moya

public extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
    
    func mapEntity<D: Decodable>(_ type: D.Type, atKeyPath keyPath: String? = nil) -> Single<D> {
        return flatMap { .just(try $0.map(type, atKeyPath: keyPath, using: JSONDecoder.default,
                                          failsOnEmptyData: true)) }
    }
}
