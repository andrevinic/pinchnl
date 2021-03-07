//
//  AlbumViewModel.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import RxSwift
import RxCocoa

protocol AlbumViewModelContract {
    var albums:Driver<[AlbumModels.ViewModel]> { get set }
    func requestAlbum()
}
class AlbumViewModel: BaseViewModel, AlbumViewModelContract {
    
    private var _albums = PublishSubject<[AlbumModels.ViewModel]>()
    lazy var albums:Driver<[AlbumModels.ViewModel]> = {
        _albums.asDriver(onErrorJustReturn: [])
    }()
    
    private let repository: AlbumRepositoryContract
    
    init(repository: AlbumRepositoryContract) {
        self.repository = repository
    }
    
    func requestAlbum() {
        repository
            .requestAlbum()
            .subscribe(onSuccess: { [unowned self] (response) in
                self._albums.onNext(self.makeAlbumListModel(response))
            }, onError: self.handleError(error:))
            .disposed(by: self.disposeBag)
    }
    
    private func makeAlbumListModel(_ response: [AlbumResponse]) -> [AlbumModels.ViewModel] {
        var albumModels: [AlbumModels.ViewModel] = []
        response.forEach {
            let albumModel = AlbumModels.ViewModel(id: $0.id)
            albumModels.append(albumModel)
        }
        return albumModels
    }
}
