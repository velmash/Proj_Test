//
//  AppFlow.swift
//  PocketLoa
//
//  Created by 윤형찬 on 2022/12/27.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

class AppFlow: Flow {
    var window: UIWindow
    
    var root: Presentable {
        return self.window
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? LoaStep else { return .none }
        switch step {
        case .splash:
            return self.navigateToSplash()
        default:
            return .none
        }
    }
    
    private func navigateToSplash() -> FlowContributors {
        let splashFlow = SplashFlow(window: window)
        Flows.use(splashFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: splashFlow, withNextStepper: OneStepper(withSingleStep: LoaStep.splash)))
    }
}

class AppStepper: Stepper {
    let steps: PublishRelay<Step> = PublishRelay<Step>()
    private let bag = DisposeBag()
    
    init() { }
    
    var initialStep: Step {
        return LoaStep.splash
    }
}
