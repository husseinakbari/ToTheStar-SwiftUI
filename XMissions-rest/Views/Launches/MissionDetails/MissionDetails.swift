//
//  MissionDetails.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/9/1400 AP.
//

import SwiftUI

struct MissionDetails: View {
    @ObservedObject var launchesVM: LaunchesViewModel
    let launch: LaunchModel
    let launcheImage: Data
    
    init(launch: LaunchModel, launchImage: Data) {
        self.launch = launch
        self.launcheImage = launchImage
        self.launchesVM = LaunchesViewModel()
    }
    
    var body: some View {
        ZStack {
            Color("navy-blue").edgesIgnoringSafeArea([.top,.bottom])
            
            ScrollView {
                    
                ImageSliderView(images: Tools.missionsImages())
                
                VStack(spacing: 20) {
                    InformationView(launch: launch, launcheImage: launcheImage)
                    
                    LauncheDesc(launch: launch)
                    
                    if launchesVM.isLoading {
                        RocketInfo(rocket: nil)
                        Launchpad(launchpad: nil)
                    } else if let rocket = launchesVM.rocket {
                        RocketInfo(rocket: rocket)
                    }
                    
                    if let launchpad = launchesVM.launchpad {
                        Launchpad(launchpad: launchpad)
                    }

                    
                }
                .padding(.all, 15)
                
                Spacer()
            }
            .navigationBarTitle(launch.name ?? "Unkonwn")
            .navigationBarTitleDisplayMode(.inline)
        }.onAppear {
            self.launchesVM.getRocketData(rocketID: launch.rocket)
            if let launchpadID = launch.launchpad {
                self.launchesVM.getLaunchpadData(launchpadID: launchpadID)
            }
        }
    }
}



struct MissionDetails_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetails(launch: LaunchModel(id: "", name: "Mission name", flight_number: 1, date_utc: "", success: false, links: nil, details: "", rocket: "", launchpad: ""), launchImage: Data())
            .environmentObject(ContentVM())
    }
}
