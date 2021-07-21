//
//  LaunchesVM.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/10/1400 AP.
//

import Foundation
import Combine

final class LaunchesViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var rocket: RocketModel?
    @Published var flickerImages = [Data]()
    @Published var launchpad: LaunchpadModel?
    @Published var launchpadImage: Data?
    
    func getRocketData(rocketID: String? = nil) {
        self.isLoading.toggle()
        
        Network.getRockets(id: rocketID) { rockets, error in
            if let rockets = rockets, error == .none {
                
                self.rocket = rockets.first
                self.isLoading.toggle()
                
            } else if error == .network {
                
            }
        }
    }
    
    func getFlikerImages(links: [String]) {
    
        if links.count > 0 {
            for link in links {
                Network.fetchData(from: link) { data, error in
                    if let data = data, error == .none {
                        self.flickerImages.append(data)
                    }
                }
            }
        }
    }
    
    func getLaunchpadData(launchpadID: String? = nil) {
        
        Network.getLaunchpads(id: launchpadID) { launchpads, error in
            if let launchpads = launchpads, error == .none {
                
                let launchpad = launchpads.first
                self.launchpad = launchpad
            }
        }
    }
    
    func getLaunchpadImage(url: String) {
        self.isLoading = true
        Network.fetchData(from: url) { data, error in
            if let data = data, error == .none {
                self.launchpadImage = data
            }
            self.isLoading = false
        }
    }
}
