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
                    
                    if let nextLaunch = backgroundVM.nextLaunch,
                       let nextLaunchDate = backgroundVM.nextLaunchDate {
                        
                        NavigationLink(
                            destination: MissionDetails(launch: nextLaunch, launchImage: Data()),
                            label: {
                                NextLaunchView(launch: nextLaunch, launchTime: nextLaunchDate)
                            })
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
