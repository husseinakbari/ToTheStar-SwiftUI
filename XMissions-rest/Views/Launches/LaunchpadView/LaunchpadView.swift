//
//  LaunchpadView.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/21/1400 AP.
//

import SwiftUI

struct LaunchpadView: View {
    @EnvironmentObject var contentVM: ContentVM
    let launchpad: LaunchpadModel?
    
    init(launchpad: LaunchpadModel) {
        self.launchpad = launchpad
    }
    
    var body: some View {
        ZStack {
            Color("navy-blue").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                VStack{}
                    .frame(width: 100, height: 5, alignment: .center)
                    .background(Color("light-gray"))
                    .cornerRadius(30)
                    .padding([.top, .bottom], 20)
                
                ScrollView {
                    if let latitude = launchpad?.latitude, let longitude = launchpad?.longitude {
                        MapView(latitude: latitude, longitude: longitude, zoomLevel: 0.5, tint: .blue)
                            .frame(width: UIScreen.main.bounds.width, height: 260, alignment: .center)
                    }
                    
                    VStack {
                        VStack {
                            HeaderLabel(title: "Description", paddingBottom: 0)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                if let name = launchpad?.name {
                                    RowData(label: "Name", value: name.capitalized)
                                }
                                if let fullName = launchpad?.full_name {
                                    RowData(rowType: .multiline ,label: "Full name", value: fullName.capitalized)
                                }
                                if let locality = launchpad?.locality {
                                    RowData(label: "Location", value: locality.capitalized)
                                }
                                if let status = launchpad?.status {
                                    RowData(label: "Status", value: status.capitalized)
                                }
                                if let attempts = launchpad?.launch_attempts {
                                    RowData(label: "Total launches", value: String(attempts))
                                }
                                if let success = launchpad?.launch_successes {
                                    RowData(label: "Successful launches", value: String(success))
                                }
                                BlueBox.divider()
                                
                                if let images = launchpad?.images?.large, images.count > 0 {
                                    VStack(alignment: .center) {
                                        if self.contentVM.isLoading {
                                            LoadingIndicator(size: 50)
                                        } else if let launchpadImage = self.contentVM.launchpadImage {
                                            Image(uiImage: UIImage(data: launchpadImage)!)
                                                .resizable()
                                                .scaledToFit()
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding([.top,.bottom], 10)
                                }
                                
                                if let details = launchpad?.details {
                                    Text(details)
                                        .foregroundColor(Color("light-gray"))
                                        .font(.system(size: 14, weight: .medium, design: .rounded))
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                                
                                
                            }.blueBox()
                        }
                    }.padding(15)
                }
                
            }
        }.onAppear {
            if let images = launchpad?.images?.large, images.count > 0 {
                if let url = images.first {
                    self.contentVM.getLaunchpadImage(url: url)
                }
                
            }
        }
    }
}

struct LaunchpadView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchpadView(launchpad: LaunchpadModel(id: "", name: "Kwajalein Atoll", full_name: "Kwajalein Atoll Omelek Island", locality: "Omelek Island", latitude: 9.0477206, longitude: 167.7431292, launch_attempts: 5, launch_successes: 2, rockets: [], launches: [], details: "SpaceX's original pad, where all of the Falcon 1 flights occurred (from 2006 to 2009).", status: "retired", images: LaunchpadImagesModel(large: ["https://i.imgur.com/GGPgsVs.png"])))
            .environmentObject(ContentVM())
    }
}
