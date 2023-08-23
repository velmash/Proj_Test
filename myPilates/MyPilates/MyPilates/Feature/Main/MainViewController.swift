//
//  ViewController.swift
//  MyPilates
//
//  Created by 윤형찬 on 2022/11/10.
//

import UIKit

class MainViewController: BaseViewController, HasCustomView {
    
    typealias CustomView = MainView

    override func loadView() {
        super.loadView()

        let customView = CustomView(frame: self.view.frame)
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

