//
//  MissionCell.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/9/1400 AP.
//

import SwiftUI

struct MissionCell: View {
    @EnvironmentObject var contentVM: ContentVM
    
    let mission: LaunchModel
    
    init(mission: LaunchModel) {
        self.mission = mission
    }
    
    var body: some View {
        HStack {
        
            if let image = contentVM.upcomingMisisons.1[mission.id] {
                Image(uiImage: UIImage(data: image)!)
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.black)
            } else {
                VStack(alignment: .center) {
                    Image("rocket")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(Color("dark-gray"))
                }
                .frame(width: 40, height: 40, alignment: .center)
                .background(Color("light-gray"))
                .cornerRadius(50)
            }
            

            
            VStack(alignment: .leading, spacing: 5) {
                Text(mission.name ?? "")
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .bold, design: .rounded))

                if let launchDate = mission.date_utc {
                    Text(Date.dateFormatter(time: launchDate))
                        .foregroundColor(Color("light-gray"))
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                }
            }
        }
    }
}

struct MissionCell_Previews: PreviewProvider {
    static var previews: some View {
        MissionCell(mission: LaunchModel(id: "1", name: "Misison name", flight_number: 1, date_utc: "", success: false, links: nil, details: "details", rocket: ""))
            .environmentObject(ContentVM())
            .previewLayout(.sizeThatFits)
    }
}
