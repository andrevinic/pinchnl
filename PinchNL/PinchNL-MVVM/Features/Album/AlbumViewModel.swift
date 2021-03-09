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
    func requestAlbum(page: Int)
    func refreshAlbum(page: Int)
}
class AlbumViewModel: BaseViewModel, AlbumViewModelContract {
    
    private var _albums = PublishSubject<[AlbumModels.ViewModel]>()
    lazy var albums:Driver<[AlbumModels.ViewModel]> = {
        _albums.asDriver(onErrorJustReturn: [])
    }()
    private var albumModels: [AlbumModels.ViewModel] = []
    
    private let repository: AlbumRepositoryContract
    
    init(repository: AlbumRepositoryContract) {
        self.repository = repository
    }
    
    func requestAlbum(page: Int) {
        repository
            .requestAlbum(page: page)
            .subscribe(onSuccess: { [unowned self] (response) in
                self._albums.onNext(self.makeAlbumListModel(response))
            }, onError: self.handleError(error:))
            .disposed(by: self.disposeBag)
    }
    
    func refreshAlbum(page: Int) {
        self.albumModels.removeAll()
        requestAlbum(page: page)
    }
    
    private func makeAlbumListModel(_ response: [AlbumResponse]) -> [AlbumModels.ViewModel] {
        response.forEach {
            let albumModel = AlbumModels.ViewModel(
                id: String($0.id),
                title: $0.title
            )
            albumModels.append(albumModel)
        }
        return albumModels
    }
}
