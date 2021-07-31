//
//  ContentVM.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/5/1400 AP.
//

import SwiftUI

final class ContentVM: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var tabBarSelection: TabItemsTag = .home
    @Published var customAlert = CustomAlertModel(show: false, title: "", message: "", primaryButton: .default(Text("Got it")), secondaryButton: .default(Text("Got it")))
    @Published var downloadedImage: Data?
  
    @Published var company: CompanyModel?
    @Published var upcomingMisisons = ([LaunchModel](), [String: Data]())
    @Published var pastLaunches = ([LaunchModel](), [String: Data]())
    @Published var rocket: RocketModel?
    @Published var launchpad: LaunchpadModel?
    @Published var flickerImages = [Data]()
    @Published var launchpadImage: Data?

    init() {
        getUpcomingData()
        getPastLaunchData()
        getCompanyData()
    }
    
    private func getCompanyData() {
        Network.getCompanyData { data, error in
            if let data = data, error == .none {
                self.company = data
            } else if error == .network {
                self.customAlert = CustomAlertModel(
                    show: true,
                    title: "Network Problem!",
                    message: "Sorry, There is problem in fetch data from server",
                    primaryButton: .destructive(Text("Close")),
                    secondaryButton: .default(Text("Try again"), action: self.getCompanyData)
                )
            }
        }
    }
    
    private func getUpcomingData() {
        self.isLoading.toggle()
        
        Network.getUpcomingLaunches { missions, error in
            if let missions = missions, error == .none {
                
                self.upcomingMisisons.0 = missions
                
                for mission in missions {
                    if let URLPatch = mission.links?.patch?.small {
                        Network.fetchData(from: URLPatch) { data, error in
                            if let imageData = data, error == .none {
                                self.upcomingMisisons.1[mission.id] = imageData
                            }
                        }
                    }
                }
                
                self.isLoading.toggle()
            } else if error == .network {
                self.customAlert = CustomAlertModel(
                    show: true,
                    title: "Network Problem!",
                    message: "Sorry, There is problem in fetch data from server",
                    primaryButton: .destructive(Text("Close")),
                    secondaryButton: .default(Text("Try again"), action: self.getCompanyData)
                )
            }
        }
    }
    
    private func getPastLaunchData() {
        self.isLoading.toggle()
        
        Network.getPastLaunches { launches, error in
            if let launches = launches, error == .none {
                
                self.pastLaunches.0 = launches
                
//                for launche in launches {
//                    if let URLPatch = launche.links?.patch?.small {
//                        Network.fetchData(from: URLPatch) { data, error in
//                            if let imageData = data, error == .none {
//                                self.pastLaunches.1[launche.id] = imageData
//                            }
//                        }
//                    }
//                }
                
                self.isLoading.toggle()
            } else if error == .network {
                self.customAlert = CustomAlertModel(
                    show: true,
                    title: "Network Problem!",
                    message: "Sorry, There is problem in fetch data from server",
                    primaryButton: .destructive(Text("Close")),
                    secondaryButton: .default(Text("Try again"), action: self.getCompanyData)
                )
            }
        }

    }
    

    func getRocketData(rocketID: String? = nil) {
        
        Network.getRockets(id: rocketID) { rockets, error in
            if let rockets = rockets, error == .none {
                
                self.rocket = rockets.first
                
            } else if error == .network {
                
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
    
    func getLaunchpadImage(url: String) {
        self.isLoading = true
        Network.fetchData(from: url) { data, error in
            if let data = data, error == .none {
                self.launchpadImage = data
            }
            self.isLoading = false
        }
    }
    
    func clearPublishers() {
        self.rocket = nil
        self.launchpad = nil
    }

}
