//
//  Network.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/6/1400 AP.
//

import Foundation
import Alamofire

final class Network {
    
    static func fetchData(from url: String, completion: @escaping (Data?, ErrorTypes) -> ()) {
        guard let url = URL(string: url) else {
            completion(nil, .network)
            fatalError("❌ URL not valid")
        }
        
        AF.download(url)
            .responseData { response in
            if response.error == nil, let data = response.value {
                completion(data, .none)
            } else {
                completion(nil, .network)
                print("❌ Error in fetch data")
            }
        }
    }
    
    // MARK: - Company Request
    static func getCompanyData(completion: @escaping (CompanyModel?, ErrorTypes) -> ()) {
        AF.request(URLs.company, method: .get)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    
                    guard let data = response.data else {
                        completion(nil, .network)
                        return
                    }
                    
                    do {
                        let result = try JSONDecoder().decode(CompanyModel.self, from: data)
                        
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
    // MARK: - Upccoming Launche Request
    static func getUpcomingLaunches(completion: @escaping ([LaunchModel]?, ErrorTypes) -> ()) {
        AF.request(URLs.upcomingLaunches, method: .get)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    
                    guard let data = response.data else {
                        completion(nil, .network)
                        return
                    }
                    
                    do {
                        let dataDecoded = try JSONDecoder().decode([LaunchModel].self, from: data)
                        
                        completion(dataDecoded, .none)
                        
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
    // MARK: - Rockets Request
    static func getRockets(id: String? = nil ,completion: @escaping ([RocketModel]?, ErrorTypes) -> ()) {
        var url = URLs.rockets
        var rockets = [RocketModel]()
        
        if let rocketID = id {
            url += "/\(rocketID)"
        }

        AF.request(url, method: .get)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:

                    guard let data = response.data else {
                        completion(nil, .network)
                        return
                    }
                    
                    do {
                        if id != nil {
                            let result = try JSONDecoder().decode(RocketModel.self, from: data)
                            rockets.append(result)
                        } else {
                            rockets = try JSONDecoder().decode([RocketModel].self, from: data)
                        }
                        
                        completion(rockets, .none)

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
