//
//  ContentVM.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/5/1400 AP.
//

import SwiftUI
import Alamofire

class ContentVM: ObservableObject {
    @Published var customAlert = CustomAlertModel(isShow: false, title: "", message: "", primaryButton: nil, secondaryButton: nil)
    @Published var tabBarSelection: Int = 0
    
    func getInitialData() {
        print("Get Inital")
        
        Network.getAllHistorical { result, error in
            if let histories = result, error == .none {
                print(histories)
            } else if error == .network {
                
                self.customAlert = CustomAlertModel(
                    isShow: true,
                    title: "Network Problem!",
                    message: "Sorry, There is problem in fetch data from server",
                    primaryButton: .destructive(Text("Close")),
                    secondaryButton: .default(Text("Try again"), action: self.getInitialData)
                )
    
            }
        }
        
    }
}
