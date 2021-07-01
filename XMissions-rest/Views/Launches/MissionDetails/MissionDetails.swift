//
//  MissionDetails.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/9/1400 AP.
//

import SwiftUI

struct MissionDetails: View {
    let mission: LaunchModel
    
    var body: some View {
        ZStack {
            Color("navy-blue").edgesIgnoringSafeArea([.top,.bottom])
            
            ScrollView {
                VStack {
                    
                    ImageSliderView()
                    
                    VStack(spacing: 20) {
                        InformationView(mission: mission)
                        
//                        if (mission != nil) {
//                            RocketInfo(missionDetailVM: self.missionDetailVM)

//                            SiteInfo(missionDetailVM: self.missionDetailVM)
//                        }
                        
                    }.padding(.all, 15)
                    
                    Spacer()
                }
            }
            .navigationBarTitle(mission.name ?? "Unkonwn")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



struct MissionDetails_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetails(mission: LaunchModel(id: "", name: "Mission name", flight_number: 1, date_utc: "", success: false, links: nil, details: "", rocket: ""))
            .environmentObject(ContentVM())
    }
}
