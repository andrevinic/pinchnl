//
//  AlbumViewModel.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import RxSwift
import RxCocoa

protocol AlbumViewModelContract {
    var albums:Driver<[AlbumModels.ViewData]> { get }
    var refresh: Driver<()> { get set }

    func requestAlbum(page: Int)
    func refreshAlbum(page: Int)
}
class AlbumViewModel: BaseViewModel, AlbumViewModelContract {
    
    private var _albums = PublishSubject<[AlbumModels.ViewData]>()
     var albums:Driver<[AlbumModels.ViewData]> {
        _albums.asDriver(onErrorJustReturn: [])
    }
    
    private lazy var _refresh = PublishSubject<()>()
    lazy var refresh: Driver<()> = {
        _refresh.asDriver(onErrorJustReturn: ())
    }()
    
    private var albumModels: [AlbumModels.ViewData] = []
    
    private let repository: AlbumRepositoryContract
    
    init(repository: AlbumRepositoryContract) {
        self.repository = repository
    }
    
    func requestAlbum(page: Int) {
        repository
            .requestAlbum(page: page)
            .subscribe(onSuccess: { [unowned self] (response) in
                self._albums.onNext(self.makeAlbumListModel(response))
                self._refresh.onNext(())
            }, onError: self.handleError(error:))
            .disposed(by: self.disposeBag)
    }
    
    func refreshAlbum(page: Int) {
        self.albumModels.removeAll()
        requestAlbum(page: page)
    }
    
    private func makeAlbumListModel(_ response: [AlbumResponse]) -> [AlbumModels.ViewData] {
        response.forEach {
            let albumModel = AlbumModels.ViewData(
                id: String($0.id),
                title: $0.title
            )
            albumModels.append(albumModel)
        }
        return albumModels
    }
}
