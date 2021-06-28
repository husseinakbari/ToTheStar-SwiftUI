//
//  ContentVM.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/5/1400 AP.
//

import SwiftUI

final class ContentVM: ObservableObject {
    @Published var tabBarSelection: Int = 0
    @Published var customAlert = CustomAlertModel(show: false, title: "", message: "", primaryButton: .default(Text("Got it")), secondaryButton: .default(Text("Got it")))
    @Published var company: CompanyModel?
    
    init() {
//        getCompanyData()
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
}
