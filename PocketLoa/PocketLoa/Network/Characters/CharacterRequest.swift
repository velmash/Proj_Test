//
//  CharacterRequest.swift
//  PocketLoa
//
//  Created by 윤형찬 on 2022/12/14.
//

import Foundation
import RxSwift

class CharacterRequest {
    static let shared = CharacterRequest()
    
    func requestCharacters(name: String) -> Observable<Result<[CharacterInfo], APIError>> {
        return NetworkService.requestGet(route: .characterInfo(name)).asObservable()
            .withUnretained(self)
            .map { owner, result -> Result<[CharacterInfo], APIError> in
                switch result {
                case .success(let data):
                    if let resultData = data, let responseJSON = try? JSONSerialization.jsonObject(with: resultData) as? [[String : Any]] {
                        var resultCharacterInfo = [CharacterInfo]()
                        
                        for item in responseJSON {
                            if let decodedData = try? JSONDecoder().decode(CharacterInfo.self, from: JSONSerialization.data(withJSONObject: item)) {
                                resultCharacterInfo.append(decodedData)
                            }
                        }
                        return .success(resultCharacterInfo)
                    } else {
                        return .success([])
                    }
                case .failure(let error):
                    return .failure(error)
                }
            }
    }
}
