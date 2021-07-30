//
//  MissionDetails.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/9/1400 AP.
//

import SwiftUI

struct MissionDetails: View {
    @EnvironmentObject var contentVM: ContentVM
    let launch: LaunchModel
    let launcheImage: Data
    
    init(launch: LaunchModel, launchImage: Data) {
        self.launch = launch
        self.launcheImage = launchImage
    }
    
    var body: some View {
        ZStack {
            Color("navy-blue").edgesIgnoringSafeArea([.top,.bottom])
            
            ScrollView {
                    
                ImageSliderView(images: Tools.missionsImages())
                
                VStack(spacing: 20) {
                    InformationView(launch: launch, launcheImage: launcheImage)
                    
                    LauncheDesc(launch: launch)
                    
                    if let rocket = contentVM.rocket {
                        RocketInfo(rocket: rocket)
                    }
                    
                    if let launchpad = contentVM.launchpad {
                        Launchpad(launchpad: launchpad)
                    }

                    
                }
                .padding(.all, 15)
                
                Spacer()
            }
            .navigationBarTitle(launch.name ?? "Unkonwn")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if let rocketID = launch.rocket {
                    self.contentVM.getRocketData(rocketID: rocketID)
                }

                if let launchpadID = launch.launchpad {
                    self.contentVM.getLaunchpadData(launchpadID: launchpadID)
                }
            }
        }
        .onDisappear {
            self.contentVM.clearPublishers()
        }
    }
}



struct MissionDetails_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetails(launch: LaunchModel(id: "", name: "Mission name", flight_number: 1, date_utc: "", success: false, links: nil, details: "", rocket: "", launchpad: ""), launchImage: Data())
            .environmentObject(ContentVM())
    }
}
