//
//  ViewController.swift
//  PocketLoa
//
//  Created by 윤형찬 on 2022/12/16.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

class LaunchScreenViewController: UIViewController, Stepper {
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
    var time: Float = 0.0
    var timer = Timer()
    
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        progressView.setProgress(time, animated: true)
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(setProgress), userInfo: nil, repeats: true)
    }

    @objc func setProgress() {
        time += 0.001
        let percent = time / 3.0
        progressView.setProgress(percent, animated: true)
        if time >= 3.0 {
//            self.delegate?.goMain()
            self.steps.accept(LoaStep.main)
            timer.invalidate()
        }
    }
}
