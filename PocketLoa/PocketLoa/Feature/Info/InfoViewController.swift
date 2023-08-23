//
//  InfoViewController.swift
//  PocketLoa
//
//  Created by 윤형찬 on 2022/12/27.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

class InfoViewController: BaseViewController, Stepper {
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
