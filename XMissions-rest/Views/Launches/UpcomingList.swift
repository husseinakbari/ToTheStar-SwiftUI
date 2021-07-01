//
//  UpcomingLaunchesList.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/9/1400 AP.
//

import SwiftUI

struct UpcomingList: View {
    @EnvironmentObject var contentVM: ContentVM
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        print("Init Upcomig List")
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("navy-blue").edgesIgnoringSafeArea(.all)
                
                List {
                    if contentVM.isLoading {
                        ForEach(1..<10) { _ in
                            MissionCell(mission: LaunchModel(id: "", name: "###################", flight_number: 111, date_utc: "2020-11-21T17:17:00.000Z", success: false, links: nil, details: "", rocket: ""))
                                .listRowBackground(Color("navy-blue"))
                                .redacted(reason: .placeholder)
                            
                        }
                        .listRowInsets(EdgeInsets())
                        .frame(height: 60)
                        
                    } else if let missions = contentVM.upcomingMisisons {
                        ForEach(missions) { mission in
                            NavigationLink(destination: MissionDetails(mission: mission)) {
                                MissionCell(mission: mission)
                            }
                            .listRowBackground(Color("navy-blue"))
                            
                            
                        }
                        .listRowInsets(EdgeInsets())
                        .frame(height: 60)
                    }
                }
            }
            .navigationBarTitle("Upcoming")
        }
    }
}

struct UpcomingList_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingList()
            .environmentObject(ContentVM())
    }
}
