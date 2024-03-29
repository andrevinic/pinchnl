//
//  PhotoDetailViewModel.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 08/03/21.
//

import UIKit

protocol PhotoDetailViewModelContract {
    var photoSelected: PhotosModels.ViewData { get set }
}

class PhotoDetailViewModel: BaseViewModel, PhotoDetailViewModelContract {
    
    var photoSelected: PhotosModels.ViewData
    
    init(photoSelected: PhotosModels.ViewData) {
        self.photoSelected = photoSelected
    }
    
}
