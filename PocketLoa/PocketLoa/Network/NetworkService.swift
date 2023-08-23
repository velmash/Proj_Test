//
//  NetworkService.swift
//  PocketLoa
//
//  Created by 윤형찬 on 2022/12/13.
//

import Foundation
import RxSwift
import Alamofire

enum APIError: Error {
    case network
    case url
    
    var value: String {
        switch self {
        case .url:
            return "URL 생성오류"
        case .network:
            return "네트워크 통신 오류"
        }
    }
}

enum RouteURL {
    //News
    case events
    //Characters
    case characterInfo(String)
    
    var value: String {
        switch self {
        case .events:
            return "/news/events"
        case .characterInfo(let name):
            return "/characters/\(name)/siblings"
        }
    }
}

class NetworkService {
    static let baseURL: String = "https://developer-lostark.game.onstove.com"
    static let token: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IktYMk40TkRDSTJ5NTA5NWpjTWk5TllqY2lyZyIsImtpZCI6IktYMk40TkRDSTJ5NTA5NWpjTWk5TllqY2lyZyJ9.eyJpc3MiOiJodHRwczovL2x1ZHkuZ2FtZS5vbnN0b3ZlLmNvbSIsImF1ZCI6Imh0dHBzOi8vbHVkeS5nYW1lLm9uc3RvdmUuY29tL3Jlc291cmNlcyIsImNsaWVudF9pZCI6IjEwMDAwMDAwMDAwMDEyNjUifQ.XcXNradCWAsyUhAHMeGLXLqYeyiHMCGii9hCCb8XIG0_LZuu_ZgMR-Y6uKmC-LWT_OyolaaUn7BLcspLUS9sr_rt0qddVIrzhlGCX_9P99otezLROoc3OKw9u9vj7iExxRckzjtL_16MAVniG_pl2M5sZMr3ZtC9sYB2qCT3x9GmAIujqjtBJLAEsx4bvjjumWRBFu8PWX0dHgm681AMsXSOzOi_4b4u7twoFNFjp5gzbnXOryKY3tFrcBmPdtlTOAyLxRPoxLljXnJz6fAQBuWL3uoH2_xKKmdhYfRTO65jvxSEEOG963CM4hcNu8jZtzHIc2MpStPti55YPiAjwQ"
    
    static let getRequestHeader: HTTPHeaders = [
        .contentType("application/json"),
        .accept("application/json"),
        .authorization("Bearer \(token)")
    ]
    
    static func requestGet(route: RouteURL, parameters: Parameters? = nil) -> Observable<Result<Data?, APIError>> {
        
        let url = baseURL + route.value
        
        return Observable<Result<Data?, APIError>>.create { observer in
            if let encoded = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let requestURL = URL(string: encoded) {
                let dataRequest = AF.request(requestURL, method: .get, parameters: parameters, headers: getRequestHeader)
                    .response { response in
                        switch response.result {
                        case .success(let data):
                            observer.onNext(.success(data))
                        case .failure(_):
                            observer.onNext(.failure(APIError.network))
                        }
                        
                        observer.onCompleted()
                    }
                return Disposables.create {
                    dataRequest.cancel()
                }
            } else {
                observer.onNext(.failure(APIError.url))
                observer.onCompleted()
                return Disposables.create()
            }
        }
    }
    
//    static func requestPost(route: RouteURL, parameters: Parameters? = nil) -> Observable<Result<Data?, APIError>> {
//        let url = baseURL + route.value
//
//        return Observable<Result<Data?, APIError>>.create { observer in
//            if let encoded = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let requestURL = URL(string: encoded) {
//                return Disposables.create {
//                    let dataRequest = AF.request(requestURL, method: .get, encoder: <#T##ParameterEncoder#>)
//                }
//            } else {
//                return Disposables.create()
//            }
//
//        }
//    }
}

