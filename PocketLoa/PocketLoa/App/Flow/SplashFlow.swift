//
//  SplashFlow.swift
//  PocketLoa
//
//  Created by 윤형찬 on 2022/12/27.
//

import Foundation
import RxFlow

class SplashFlow: Flow {
    var window: UIWindow
    
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? LoaStep else { return .none }
        switch step {
        case .splash:
            return self.navigateToSplash()
        case .main:
            return self.navigateToHome()
        default:
            return .none
        }
    }
    
    private func navigateToSplash() -> FlowContributors {
        //        let viewController = LaunchScreenViewController()
        let storyboard = UIStoryboard(name: "LaunchScreenViewController", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(identifier: "LaunchVC") as! LaunchScreenViewController
        self.rootViewController.setViewControllers([viewController], animated: false)
        return .one(flowContributor: .contribute(withNext: viewController))
    }
    
    private func navigateToHome() -> FlowContributors {
        let mainFlow = MainFlow()
        Flows.use(mainFlow, when: .created) { root in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: mainFlow, withNextStepper: OneStepper(withSingleStep: LoaStep.main)))
    }
    
//    private func navigateToMain() -> FlowContributors {
//        let storyboard = UIStoryboard(name: "MainViewController", bundle: Bundle.main)
//        let viewController = storyboard.instantiateViewController(identifier: "MainVC") as! MainViewController
//        //        let viewController = MainViewController()
//        self.rootViewController.setViewControllers([viewController], animated: true)
//        return .one(flowContributor: .contribute(withNext: viewController))
//    }
}
