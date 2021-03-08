//
//  PinchAPIProvider.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import Moya

class PinchAPIProvider<T: TargetType>: MoyaProvider<T> {

    init() {
        let configuration = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let plugin = NetworkLoggerPlugin(configuration: configuration)
        let networkLogger = [plugin]
        super.init(plugins: networkLogger)
    }
}
