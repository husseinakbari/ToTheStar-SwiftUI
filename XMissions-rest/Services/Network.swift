//
//  Network.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/6/1400 AP.
//

import Foundation
import Alamofire

final class Network {
    
    static func getAllHistorical(completion: @escaping ([HistoryModel]?, ErrorTypes) -> ()) {
        AF.request(URLs.history, method: .get)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    
                    guard let data = response.data else {
                        completion(nil, .network)
                        return
                    }
                    
                    do {
                        let result = try JSONDecoder().decode([HistoryModel].self, from: data)
                        
                        completion(result, .none)
                        
                    } catch let error {
                        completion(nil, .network)
                        print("❌ \(error)")
                    }
                    
                case let .failure(error):
                    completion(nil, .network)
                    print("❌ \(error)")
                }
            }
    }
}
