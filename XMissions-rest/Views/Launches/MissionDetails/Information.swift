//
//  Information.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/10/1400 AP.
//

import SwiftUI

struct InformationView: View {
    @EnvironmentObject var contentVM: ContentVM
    
    let mission: LaunchModel
    private let frameSize = CGFloat(50)
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                
                HStack {
                    if let image = contentVM.upcomingMisisons.1[mission.id] {
                        Image(uiImage: UIImage(data: image)!)
                            .resizable()
                            .frame(width: frameSize, height: frameSize, alignment: .center)
                            .foregroundColor(.black)
                    } else {
                        VStack(alignment: .center) {
                            Image("rocket")
                                .resizable()
                                .frame(width: 35, height: 35, alignment: .center)
                                .foregroundColor(Color("dark-gray"))
                        }
                        .frame(width: frameSize, height: frameSize, alignment: .center)
                        .background(Color("light-gray"))
                        .cornerRadius(50)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(mission.name ?? "Unknown")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                    
                    if let launchDate = mission.date_utc {
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
            
            if let details = mission.details {
                LabelDivider(label: "Details")
            
                VStack(alignment: .leading) {
                    Text(details)
                        .foregroundColor(Color("light-gray"))
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            
        }
        .blueBox()
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(mission: LaunchModel(id: "", name: "Unknown", flight_number: 1, date_utc: "", success: false, links: nil, details: "", rocket: ""))
            .previewLayout(.sizeThatFits)
            .environmentObject(ContentVM())
    }
}
