//
//  ContentVM.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/5/1400 AP.
//

import SwiftUI

final class ContentVM: ObservableObject {
    @Published var tabBarSelection: TabItemsTag = .home
    @Published var customAlert = CustomAlertModel(show: false, title: "", message: "", primaryButton: .default(Text("Got it")), secondaryButton: .default(Text("Got it")))
    @Published var isLoading: Bool = false
    @Published var downloadedImage: Data?
    
    @Published var company: CompanyModel?
    @Published var upcomingMisisons = [LaunchModel]()
    
    init() {
        getUpcomingData()
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
    
    func getUpcomingData() {
        self.isLoading.toggle()
        
        Network.getUpcomingLaunches { missions, error in
            if let missions = missions, error == .none {
                print(missions)
                self.upcomingMisisons = missions
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
    
    func downloadImage(url: String) {
        guard let url = URL(string: url) else {
            fatalError("Image URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedImage = data
            }
        }.resume()
    }
}
