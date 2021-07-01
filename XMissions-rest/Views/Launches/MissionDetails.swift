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
        Text(mission.name ?? "Mission name")
    }
}

struct MissionDetails_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetails(mission: LaunchModel(id: "", name: "Mission name", flight_number: 1, date_utc: "", success: false, links: nil, details: "", rocket: ""))
    }
}
