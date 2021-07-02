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
}
