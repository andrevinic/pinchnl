//
//  BaseViewController.swift
//  PinchNL-VIP
//
//  Created by Andre Nogueira on 09/03/21.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable,
    message: "Loading this view controller from a nib is unsupported."
    )
    @available(*, unavailable,
    message: "Loading this view controller from a nib is unsupported."
    )
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this view controller from a nib is unsupported.")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    deinit {
        print("🅲 the \(self) was deinitalized")
    }
}
