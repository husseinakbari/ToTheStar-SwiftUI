//
//  RocketView.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/12/1400 AP.
//

import SwiftUI

struct RocketView: View {
    @EnvironmentObject var contentVM: ContentVM
    
    let rocket: RocketModel
    
    init(rocket: RocketModel) {
        self.rocket = rocket
    }
    
    var body: some View {
        ZStack {
            Color("navy-blue").edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack{}
                    .frame(width: 100, height: 5, alignment: .center)
                    .background(Color("light-gray"))
                    .cornerRadius(30)
                    .padding([.top, .bottom], 20)
                
                ScrollView {
                    
                    HeaderLabel(title: rocket.name ?? "Rocket name", size: 24, paddingBottom: 0, paddingLeading: 15, color: .white)
                    
                    if rocket.flickr_images?.count == contentVM.flickerImages.count {
                        ImageSliderView2(images: self.contentVM.flickerImages)
                    } else {
                        LoadingIndicator()
                    }
                    
                    
                    
                    VStack(spacing: 20) {
                    

                        Description(rocket: rocket)
                        
                        Specifications(rocket: rocket)

                        
                        if let capability = rocket.payload_weights {
                            VStack(spacing: 0) {
                                HeaderLabel(title: "Capability")
                                
                                VStack(spacing: 10) {
                                    
                                    ForEach(capability, id:\.id) { item in
                                        RowData(label: item.name?.capitalized ?? "", value: "\(item.kg?.calculator ?? "") kg")
                                    }
                            
                                }.blueBox()
                            }
                        }
                        
                        Stages(rocket: rocket)
                        
                        Engines(rocket: rocket)
                        
                        
                        
                    }.padding(.all, 15)
                }
            }
        }.onAppear {
            self.contentVM.getFlikerImages(links: rocket.flickr_images ?? [])
        }
    }
}

struct RocketView_Previews: PreviewProvider {
    static var previews: some View {
        RocketView(rocket: RocketModel(id: "1", name: "Falcon 9", description: "This is description for rocket", wikipedia: "wikipedia", company: "SpaceX", first_flight: "1234", success_rate_pct: 90, cost_per_launch: 123434545, boosters: 2, stages: 2, active: true, type: "Rocket", flickr_images: [], payload_weights: [PayloadWeightsModel(id: "leo", name: "low earth orbit", kg: 1312, lb: 324234)], landing_legs: LandingLegsModel(number: 4, material: "Carbon fiber"), engines: EngineMdoel(number: 9, type: "merlin", version: "1D+", layout: "octaweb", engine_loss_max: 2, propellant_1: "liquid oxygen", propellant_2: "RP-1 kerosene", thrust_to_weight: 180.12, thrust_sea_level: ThrustModel(kN: 914, lbf: 213213), thrust_vacuum: ThrustModel(kN: 123, lbf: 43543543), isp: ISPModel(sea_level: 288, vacuum: 213)), first_stage: StageModel(thrust_sea_level: ThrustModel(kN: 222, lbf: 232323), thrust_vacuum: ThrustModel(kN: 123, lbf: 12334), reusable: true, engines: 9, fuel_amount_tons: 385, burn_time_sec: 213), second_stage: nil, height: LongModel(meters: 112, feet: 2332.23), diameter: LongModel(meters: 232, feet: 23232), mass: WeightModel(kg: 3223, lb: 2323)))
            .environmentObject(ContentVM())
    }
}
