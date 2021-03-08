//
//  UIImageView+Extensions.swift
//  PinchNL
//
//  Created by Andre Nogueira on 08/03/21.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func loadFrom(url imageUrl: String?, placeHolder: String = "nouser") {
        let placeHolder = UIImage(named: placeHolder)
        guard let imageUrl = imageUrl else {
            self.image = placeHolder
            return
        }
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: URL(string: imageUrl),
            placeholder: placeHolder,
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
            
        ) { result in
            switch result {
            case .success: break
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
