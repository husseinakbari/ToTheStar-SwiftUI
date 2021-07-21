//
//  PastList.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/18/1400 AP.
//

import SwiftUI

struct PastList: View {
    @EnvironmentObject var contentVM: ContentVM
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        print("Init Past List")
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("navy-blue").edgesIgnoringSafeArea(.all)
                
                List {
                    if contentVM.isLoading {
                        ForEach(1..<10) { _ in
                            MissionCell(launch: LaunchModel(id: "", name: "###################", flight_number: 111, date_utc: "2020-11-21T17:17:00.000Z", success: false, links: nil, details: "", rocket: "", launchpad: ""), launchImage: Data())
                                .listRowBackground(Color("navy-blue"))
                                .redacted(reason: .placeholder)
                            
                        }
                        .listRowInsets(EdgeInsets())
                        .frame(height: 60)
                        
                    } else if let (launches, images) = contentVM.pastLaunches {
                        
                        ForEach(launches) { launch in
                            let launchImage = images[launch.id] ?? Data()
                            
                            NavigationLink(destination: MissionDetails(launch: launch, launchImage: launchImage)) {
                                MissionCell(launch: launch, launchImage: launchImage)
                            }
                            .listRowBackground(Color("navy-blue"))
                        }
                        .listRowInsets(EdgeInsets())
                        .frame(height: 60)
                    }
                }
            }
            .navigationTitle("Latest")
        }
    }
}

struct PastList_Previews: PreviewProvider {
    static var previews: some View {
        PastList()
            .environmentObject(ContentVM())
    }
}
