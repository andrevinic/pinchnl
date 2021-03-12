//
//  BaseViewController.swift
//  PinchNL-MVVM
//
//  Created by Andre Nogueira on 07/03/21.
//

import UIKit
import RxSwift

class PinchViewController: BaseViewController {
    
    internal var baseViewModel: BaseViewModelContract? {
        return nil
    }
    
    internal let disposeBag = DisposeBag()
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
}
