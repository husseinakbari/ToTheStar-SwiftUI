//
//  Information.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/10/1400 AP.
//

import SwiftUI

struct InformationView: View {
    @EnvironmentObject var contentVM: ContentVM
    
    let launch: LaunchModel
    let launcheImage: Data
    private let frameSize = CGFloat(50)
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                
                HStack {
                    if !launcheImage.isEmpty {
                        Image(uiImage: UIImage(data: launcheImage)!)
                            .resizable()
                            .frame(width: frameSize, height: frameSize, alignment: .center)
                            .foregroundColor(.black)
                    } else {
                        VStack {
                            Image("default-icon")
                                .resizable()
                        }
                        .frame(width: frameSize, height: frameSize, alignment: .center)
                        .background(Color("light-gray"))
                        .cornerRadius(50)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(launch.name ?? "Unknown")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                    
                    if let launchDate = launch.date_utc {
                        HStack {
                            Image(systemName: "calendar.badge.clock")
                                .resizable()
                                .frame(width: 15, height: 15, alignment: .center)
                                .foregroundColor(Color("light-gray"))
                            
                            Text(Date.dateFormatter(time: launchDate))
                                .foregroundColor(Color("light-gray"))
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                        }
                    }
                }
                .padding(.leading, 10)
                
                Spacer()
            }
        }
        .blueBox()
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(launch: LaunchModel(id: "", name: "Unknown", flight_number: 1, date_utc: "", success: false, links: nil, details: "", rocket: "", launchpad: ""), launcheImage: Data())
            .previewLayout(.sizeThatFits)
            .environmentObject(ContentVM())
    }
}
