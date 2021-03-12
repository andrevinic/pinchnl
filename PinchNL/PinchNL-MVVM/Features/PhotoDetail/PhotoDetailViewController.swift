//
//  PhotoDetailViewController.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 08/03/21.
//

import UIKit

class PhotoDetailViewController: PinchViewController {

    private let viewModel: PhotoDetailViewModelContract
    private let _view: PhotoDetailViewConfiguration
    
    init(
        view: PhotoDetailViewConfiguration,
        viewModel: PhotoDetailViewModelContract
    ) {
        self._view = view
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        view = _view
        let model = viewModel.photoSelected
        self.title = "Details"
        _view.configureView(model: model)
    }
    
}
