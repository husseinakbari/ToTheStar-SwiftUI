//
//  LauncheDesc.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/18/1400 AP.
//

import SwiftUI

struct LauncheDesc: View {
    let launch: LaunchModel
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderLabel(title: "Information")

            VStack(alignment: .center, spacing: 10) {
                
                
                if launch.success != nil {
                    RowData(rowType: .bool, label: "Success", value: String(launch.success ?? false))
                } else {
                    RowData(rowType: .bool, label: "Success", value: "")
                }
                    
                if let link = launch.links?.article {
                    RowData(rowType: .link, label: "Article", value: link)
                }
                if let link = launch.links?.webcast {
                    RowData(rowType: .link, label: "Youtube", value: link)
                }
                if let link = launch.links?.wikipedia {
                    RowData(rowType: .link, label: "Wikipedia", value: link)
                }
                if let link = launch.links?.presskit {
                    RowData(rowType: .link, label: "Press kit", value: link)
                }
                
                if let details = launch.details {
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
}

struct LauncheDesc_Previews: PreviewProvider {
    static var previews: some View {
        LauncheDesc(launch: LaunchModel(id: "", name: "name", flight_number: 123, date_utc: "", success: nil, links: LauncheLinkModel(presskit: "https://www.nasa.gov/pdf/694166main_SpaceXCRS-1PressKit.pdf", patch: nil, reddit: nil, webcast: "https://www.youtube.com/watch?v=0a_00nJ_Y88", article: "https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html", wikipedia: "https://en.wikipedia.org/wiki/DemoSat"), details: "SpaceX's primary west coast launch pad for polar orbits and sun-synchronous orbits,", rocket: "", launchpad: ""))
            .previewLayout(.sizeThatFits)
    }
}
