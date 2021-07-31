//
//  BackgroundVM.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 5/8/1400 AP.
//

import Foundation

final class BackgroundVM: ObservableObject {
    @Published var nextLaunch: LaunchModel?
    @Published var nextLaunchDate: LaunchDateModel?
    @Published var isLoading: Bool = false
    
    init() {
        getNextLaunchData()
    }
    
    private func getNextLaunchData() {
        self.isLoading.toggle()
        
        Network.getNextLaunche { launch, error in
            
            if let launch = launch, error == .none {
                self.nextLaunch = launch
                
                let date = Date.convertStringToDate(time: launch.date_utc ?? "")
            
                if date > Date() {
                    self.startCountingNextLaunch(date: date)
                }
                self.isLoading.toggle()
            } else if error == .network {
                
            }
        }

    }
    
    
    private func startCountingNextLaunch(date: Date) {
        var targetDate = date
        let nowDate = Date()
        let calendar = Calendar(identifier: .gregorian)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { Timer in
                    
            let components = calendar.dateComponents([.day, .hour, .minute, .second], from: nowDate, to: targetDate)
            
            self.nextLaunchDate = LaunchDateModel (
                day: String(format: "%02d", components.day ?? 00),
                hour: String(format: "%02d", components.hour ?? 00),
                minute: String(format: "%02d", components.minute ?? 00),
                second: String(format: "%02d", components.second ?? 00)
            )
            
            if targetDate < nowDate {
                Timer.invalidate()
            } else {
                targetDate -= 1
            }
            
        }

    }
}
