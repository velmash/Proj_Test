//
//  NewsRequest.swift
//  PocketLoa
//
//  Created by 윤형찬 on 2022/12/14.
//

import Foundation
import RxSwift

class NewsRequest {
    static let shared = NewsRequest()
    
    func requestEvents() -> Observable<Result<[Events], APIError>> {
        return NetworkService.requestGet(route: .events).asObservable()
            .withUnretained(self)
            .map { owner, result -> Result<[Events], APIError> in
                switch result {
                case .success(let data):
                    if let resultData = data, let responseJSON = try? JSONSerialization.jsonObject(with: resultData) as? [[String : Any]] {
                        var resultEvents = [Events]()
                        
                        for item in responseJSON {
                            if let decodedData = try? JSONDecoder().decode(Events.self, from: JSONSerialization.data(withJSONObject: item)) {
                                resultEvents.append(decodedData)
                            }
                        }
                        return .success(resultEvents)
                    } else {
                        return .success([])
                    }
                case .failure(let error):
                    return .failure(error)
                }
            }
    }
}
