//
//  ListPhotoViewModel.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import RxSwift
import RxCocoa

protocol ListPhotosViewModelContract {
    var photos: Driver<[PhotosModels.ViewModel]> { get set }
    func fetchListPhotos()
}

class ListPhotosViewModel: BaseViewModel, ListPhotosViewModelContract {
    
    private let repository: ListPhotosRepositoryContract
    private let requestService: PhotosModels.RequestService.Photos
    
    private lazy var _photos = PublishSubject<[PhotosModels.ViewModel]>()
    lazy var photos: Driver<[PhotosModels.ViewModel]> = {
        _photos.asDriver(onErrorJustReturn: [])
    }()
    
    private var photosList: [PhotosModels.ViewModel] = []
    
    init(
        repository: ListPhotosRepositoryContract,
        requestService: PhotosModels.RequestService.Photos
    ) {
        self.repository = repository
        self.requestService = requestService
    }
    
    func fetchListPhotos() {
        self.repository
            .fetchPhotos(requestService: requestService)
            .subscribe(onSuccess: { [unowned self] (result) in
                self._photos.onNext(self.makePhotosModels(response: result))
            }, onError: self.handleError(error:))
            .disposed(by: self.disposeBag)
    }
    
    private func makePhotosModels(response: [PhotoResponse]) -> [PhotosModels.ViewModel] {
        response.forEach { [weak self] in
            let model = PhotosModels.ViewModel(
                title: $0.title,
                url: $0.url,
                thumbnailUrl: $0.thumbnailUrl
            )
            self?.photosList.append(model)
        }
        return photosList
    }
    
}
