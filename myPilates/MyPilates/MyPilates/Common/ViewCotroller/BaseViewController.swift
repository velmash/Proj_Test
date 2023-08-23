//
//  BaseViewController.swift
//  MyPilates
//
//  Created by 윤형찬 on 2022/11/10.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showsNavigationBar(isHidden: true)
    }
    
    func showsNavigationBar(isHidden: Bool) {
        navigationController?.navigationBar.isHidden = isHidden
    }
}
