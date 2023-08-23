//
//  BaseView.swift
//  MyPilates
//
//  Created by 윤형찬 on 2022/11/10.
//

import UIKit
import SnapKit

class BaseView: UIView {
    lazy var statusBar = createStatusBar()
    lazy var navigationBar = createCustomNavigationBar()
    lazy var navigationTitle = createNavigationTitleLabel()
    lazy var navigationFirstButton = createNavigationFirstButton()
    lazy var navigationLastButton = createNavigationLastButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNavigationBackgroundColor(_ color: UIColor) {
        statusBar.backgroundColor = color
        navigationBar.backgroundColor = color
    }
    
    func setupNavigationTitle(_ title: String,
                              textColor: UIColor = .black) {//Asset.Color.gray9.color) {
        navigationTitle.textColor = textColor
        navigationTitle.text = title
    }

    func setupNavigationButton(_ button: UIButton, image: UIImage?) {
        button.setBackgroundImage(image, for: .normal)

        switch button {
        case navigationFirstButton:
            setupFirstButtonConstraint(button)
        case navigationLastButton:
            setupLastButtonConstraint(button)
        default:
            break
        }
    }

    func hideNavigationBar() {
        self.statusBar.isHidden = true
        self.navigationBar.isHidden = true
    }
}

extension BaseView {
    func createStatusBar() -> UIView {
        let view = createClearView()
        return view
    }

    func createCustomNavigationBar() -> UIView {
        let view = createClearView()
        return view
    }

    func createNavigationTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 19)//FontFamily.NanumSquareRoundOTF.extraBold.font(size: 19)
        label.textAlignment = .center
        return label
    }

    func createNavigationFirstButton() -> UIButton {
        let button = UIButton()
        return button
    }

    func createNavigationLastButton() -> UIButton {
        let button = UIButton()
        return button
    }

    func addBaseNaviSubviews() {
        addSubview(statusBar)
        addSubview(navigationBar)
        navigationBar.addSubview(navigationTitle)
        navigationBar.addSubview(navigationFirstButton)
        navigationBar.addSubview(navigationLastButton)

        setupConstraints()
    }

    fileprivate func createClearView() -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
}

extension BaseView {
    private func setupConstraints() {
        statusBar.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.top.leading.trailing.equalToSuperview()
        }

        navigationBar.snp.makeConstraints {
            $0.top.equalTo(statusBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)//(Constants.Design.navigationBarHeight)
        }

        navigationTitle.snp.makeConstraints {
            $0.center.leading.trailing.equalToSuperview()
        }
    }

    private func setupFirstButtonConstraint(_ button: UIButton) {
        button.snp.makeConstraints {
            $0.size.equalTo(64)
            $0.leading.equalToSuperview().offset(6)
            $0.top.bottom.equalToSuperview()
        }
    }

    private func setupLastButtonConstraint(_ button: UIButton) {
        button.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-6)
            $0.top.bottom.equalToSuperview()
        }
    }
}
