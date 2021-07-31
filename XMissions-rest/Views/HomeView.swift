//
//  HomeView.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/6/1400 AP.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var contentVM: ContentVM
    @EnvironmentObject var backgroundVM: BackgroundVM
        
    var body: some View {
        NavigationView {
            ZStack {
                Color("navy-blue").edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    if !backgroundVM.isLoading, backgroundVM.nextLaunchDate != nil {
                        if let nextLaunch = backgroundVM.nextLaunch,
                           let nextLaunchDate = backgroundVM.nextLaunchDate {
                            
                            NavigationLink(
                                destination: MissionDetails(launch: nextLaunch, launchImage: Data()),
                                label: {
                                    NextLaunchView(launch: nextLaunch, launchTime: nextLaunchDate)
                                })
                        }
                    } else {
                        NextLaunchView(launch: LaunchModel(id: "", name: "#####", flight_number: 1, date_utc: "2021-08-10T00:00:00.000Z", success: false, links: nil, details: "", rocket: "", launchpad: ""), launchTime: LaunchDateModel(day: "00", hour: "00", minute: "00", second: "00")).redacted(reason: .placeholder)
                    }
                    
                    Spacer()
                }.padding(.all, 15)
                
                
            }
            .navigationTitle("Home")
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentVM())
            .environmentObject(BackgroundVM())
            .previewDevice("iPhone 12")
    }
}
