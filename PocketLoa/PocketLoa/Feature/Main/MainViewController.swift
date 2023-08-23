//
//  ViewController.swift
//  PocketLoa
//
//  Created by 윤형찬 on 2022/12/13.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

class MainViewController: UIViewController, Stepper {
    var steps: PublishRelay<Step> = PublishRelay<Step>()
    
    private var bag = DisposeBag()
    
    @IBOutlet weak var nameTag: UILabel!
    @IBOutlet weak var testBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let serviceCharacter = CharacterRequest.shared
        let serviceNews = NewsRequest.shared
        
        serviceCharacter.requestCharacters(name: "을지로입구역")
            .withUnretained(self)
            .subscribe(onNext: { owner, result in
                switch result {
                case .success(let characters):
                    if characters.count == 0  {
                        print("서버 점검줌")
                        return
                    } else {
                        for character in characters {
                            print("INDIVIDUAL", character)
                        }
                    }
                case .failure(let error):
                    print(error.value)
                }
            })
            .disposed(by: bag)
        
        serviceNews.requestEvents()
            .withUnretained(self)
            .subscribe(onNext: { owenr, result in
                switch result {
                case .success(let news):
                    if news.count == 0 {
                        print("서버 점검중")
                        return
                    } else {
                        for new in news {
                            print("NEWS: ", new)
                        }
                    }
                case .failure(let error):
                    print(error.value)
                }
            })
            .disposed(by: bag)
        
        testBtn.rx.tap
            .withUnretained(self)
            .subscribe(onNext: { owner, _ in
                print("TTE?")
                self.steps.accept(LoaStep.info)
            })
            .disposed(by: bag)
    }
}

