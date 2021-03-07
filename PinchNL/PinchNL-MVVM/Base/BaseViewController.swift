//
//  BaseViewController.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    internal var baseViewModel: BaseViewModelContract? {
        return nil
    }
    internal let disposeBag = DisposeBag()
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
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("🅲 the \(self) was deinitalized")
    }
}
