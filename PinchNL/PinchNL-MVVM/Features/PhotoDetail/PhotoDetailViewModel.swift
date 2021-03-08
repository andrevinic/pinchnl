//
//  PhotoDetailViewModel.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 08/03/21.
//

import UIKit

protocol PhotoDetailViewModelContract {
    var photoSelected: PhotosModels.ViewModel { get set }
}

class PhotoDetailViewModel: BaseViewModel, PhotoDetailViewModelContract {
    
    var photoSelected: PhotosModels.ViewModel
    
    init(photoSelected: PhotosModels.ViewModel) {
        self.photoSelected = photoSelected
    }
    
}
