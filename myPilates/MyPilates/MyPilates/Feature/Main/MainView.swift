//
//  MainView.swift
//  MyPilates
//
//  Created by 윤형찬 on 2022/11/10.
//

import UIKit

class MainView: BaseView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.backgroundColor = .red
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .white//Asset.Color.lemon.color
        setupNavigation()
    }
    
    func setupNavigation() {
        self.addBaseNaviSubviews()
//        self.setupNavigationButton(navigationFirstButton, image: Asset.Assets.btnBack.image)
        self.setupNavigationTitle("TEST")
    }
}
