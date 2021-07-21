//
//  Launchpad.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/21/1400 AP.
//

import SwiftUI

struct Launchpad: View {
    let launchpad: LaunchpadModel?
    @State private var showLaunchpadView: Bool = false
    
    var body: some View {
        if let launchpad = launchpad {
            VStack(spacing: 0) {
                HeaderLabel(title: "Launch Pad")

                VStack(alignment: .center, spacing: 10) {

                    if let name = launchpad.name {
                        RowData(label: "Name", value: name.capitalized)
                    }
                    if let locality = launchpad.locality {
                        RowData(label: "Location", value: locality.capitalized)
                    }
                    if let status = launchpad.status {
                        RowData(label: "Status", value: status.capitalized)
                    }
                    
                    Text("More")
                        .foregroundColor(.blue)
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .onTapGesture {
                            self.showLaunchpadView.toggle()
                        }

                }
                .blueBox()
            }
            .sheet(isPresented: self.$showLaunchpadView, content: {
                LaunchpadView(launchpad: launchpad)
            })
        } else {
            VStack(spacing: 0) {
                HeaderLabel(title: "Rocket",paddingBottom: 8)
                
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(1..<4) { _ in
                        RowData(label: "###########", value: "########")
                    }
                    BlueBox.divider()
                    ForEach(1..<5) { _ in
                        RowData(label: "###########", value: "########")
                    }
                }
                .blueBox()
                .redacted(reason: .placeholder)
            }
        }
    }
}

struct Launchpad_Previews: PreviewProvider {
    static var previews: some View {
        Launchpad(launchpad: LaunchpadModel(id: "", name: "Kwajalein Atoll", full_name: "Kwajalein Atoll Omelek Island", locality: "Omelek Island", latitude: 9.0477206, longitude: 167.7431292, launch_attempts: 5, launch_successes: 2, rockets: [], launches: [], details: "SpaceX's original pad, where all of the Falcon 1 flights occurred (from 2006 to 2009).", status: "retired", images: LaunchpadImagesModel(large: ["https://i.imgur.com/GGPgsVs.png"])))
            .previewLayout(.sizeThatFits)
    }
}
