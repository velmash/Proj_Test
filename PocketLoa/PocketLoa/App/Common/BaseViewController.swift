//
//  BaseViewController.swift
//  PocketLoa
//
//  Created by 윤형찬 on 2022/12/27.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showNavigationBar(isHidden: true)
    }
    
    func showNavigationBar(isHidden: Bool) {
        navigationController?.navigationBar.isHidden = isHidden
    }
}
