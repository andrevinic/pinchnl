//
//  BaseViewModel.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import UIKit
import RxSwift
import RxCocoa

protocol BaseViewModelContract {
    var loading: Driver<Bool> { get }
    var onError: Driver<ServiceError> { get }
    func handleError(error: Error)
}

class BaseViewModel: BaseViewModelContract {
    
    internal let disposeBag = DisposeBag()
    private let handleError = HandleError()

    private let _onError = PublishSubject<ServiceError>()
    var onError: Driver<ServiceError> {
        return _onError.asDriver(onErrorJustReturn: .generic(message: ""))
    }
    
    internal let isLoading = PublishSubject<Bool>()
    var loading: Driver<Bool> {
        return isLoading.asDriver(onErrorJustReturn: false)
    }

    func handleError(error: Error) {
        self._onError.onNext(self.handleError.handle(with: error))
    }
    
    deinit {
        print("🅼 the \(self) was deinitalized")
    }
}
