//
//  MissionCell.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/9/1400 AP.
//

import SwiftUI

struct MissionCell: View {
    @EnvironmentObject var contentVM: ContentVM
    
    let launch: LaunchModel
    let launchImage: Data
    
    init(launch: LaunchModel, launchImage: Data) {
        self.launch = launch
        self.launchImage = launchImage
    }
    
    var body: some View {
        HStack {
        
            VStack {
                if !launchImage.isEmpty {
                    Image(uiImage: UIImage(data: launchImage)!)
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.black)
                } else {
                    VStack {}
                    .frame(width: 40, height: 40, alignment: .center)
                    .background(Color("light-gray"))
                    .cornerRadius(50)
                }
            }.padding(.trailing, 5)
            

            
            VStack(alignment: .leading, spacing: 5) {
                Text(launch.name ?? "")
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .bold, design: .rounded))

                if let launchDate = launch.date_utc {
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
        MissionCell(launch: LaunchModel(id: "1", name: "Misison name", flight_number: 1, date_utc: "", success: false, links: nil, details: "details", rocket: "", launchpad: ""), launchImage: Data())
            .environmentObject(ContentVM())
            .previewLayout(.sizeThatFits)
    }
}
