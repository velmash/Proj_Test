//
//  MainFlow.swift
//  PocketLoa
//
//  Created by 윤형찬 on 2022/12/27.
//

import Foundation
import RxFlow

class MainFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    init() { }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? LoaStep else { return .none }
        switch step {
        case .main:
            return self.navigateToMain()
        case .info:
            return self.navigateToInfo()
//        case .main:
//            return self.navigateToMain()
        default:
            return .none
        }
    }
    
    private func navigateToMain() -> FlowContributors {
        let storyboard = UIStoryboard(name: "MainViewController", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(identifier: "MainVC") as! MainViewController
//        let viewController = MainViewController()
        self.rootViewController.setViewControllers([viewController], animated: true)
        return .one(flowContributor: .contribute(withNext: viewController))
    }
    private func navigateToInfo() -> FlowContributors {
        let storyboard = UIStoryboard(name: "InfoViewController", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(identifier: "InfoVC") as! InfoViewController
        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(withNext: viewController))
    }
}
