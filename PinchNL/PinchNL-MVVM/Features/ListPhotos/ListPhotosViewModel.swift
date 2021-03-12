//
//  ListPhotoViewModel.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import RxSwift
import RxCocoa

protocol ListPhotosViewModelContract {
    var photos: Driver<[PhotosModels.ViewData]> { get set }
    var refresh: Driver<()> { get set }
    func fetchListPhotos()
    func refreshPhotosList()
}

class ListPhotosViewModel: BaseViewModel, ListPhotosViewModelContract {
    
    private let repository: ListPhotosRepositoryContract
    private let requestService: PhotosModels.RequestService.Photos
    
    private lazy var _photos = PublishSubject<[PhotosModels.ViewData]>()
    lazy var photos: Driver<[PhotosModels.ViewData]> = {
        _photos.asDriver(onErrorJustReturn: [])
    }()
    
    private lazy var _refresh = PublishSubject<()>()
    lazy var refresh: Driver<()> = {
        _refresh.asDriver(onErrorJustReturn: ())
    }()
    
    private var photosList: [PhotosModels.ViewData] = []
    
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
                self._refresh.onNext(())
            }, onError: self.handleError(error:))
            .disposed(by: self.disposeBag)
    }
    
    func refreshPhotosList() {
        photosList.removeAll()
        fetchListPhotos()
    }
    
    private func makePhotosModels(response: [PhotoResponse]) -> [PhotosModels.ViewData] {
        response.forEach { [weak self] in
            let model = PhotosModels.ViewData(
                title: $0.title,
                url: $0.url,
                thumbnailUrl: $0.thumbnailUrl
            )
            self?.photosList.append(model)
        }
        return photosList
    }
    
}
