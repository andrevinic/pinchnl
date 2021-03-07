//
//  UICollectionView+Extensions.swift
//  PinchNL
//
//  Created by Andre Nogueira on 07/03/21.
//

import Foundation
import UIKit

public extension UICollectionView {
    
    func register<T: UICollectionViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        register(cellType, forCellWithReuseIdentifier: cellType.className)
    }

    func register<T: UICollectionViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }

    // swiftlint:disable force_cast
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type,
                                                      for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }

    // swiftlint:disable force_cast
    func dequeueReusableView<T: UICollectionReusableView>(with type: T.Type,
                                                          for indexPath: IndexPath,
                                                          ofKind kind: String =
        UICollectionView.elementKindSectionHeader) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind,
                                                withReuseIdentifier: type.className,
                                                for: indexPath) as! T
    }
    
    func addLoading(loadingView: UIView, marginLeft: CGFloat = 0) {
        self.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([
            loadingView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            loadingView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: marginLeft)
        ])
    }
}

extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
