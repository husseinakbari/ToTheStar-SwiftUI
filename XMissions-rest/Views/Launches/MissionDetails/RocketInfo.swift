//
//  RocketInfo.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/11/1400 AP.
//

import SwiftUI

struct RocketInfo: View {
    let rocket: RocketModel?
    @State private var showRocketView: Bool = false
    
    var body: some View {
        if let rocket = rocket {
            VStack(spacing: 0) {
                HeaderLabel(title: "Rocket")

                VStack(alignment: .center, spacing: 10) {

                    if let name = rocket.name {
                        RowData(label: "Name", value: name)
                    }
                    if let company = rocket.company {
                        RowData(label: "Company", value: company)
                    }
                    if rocket.active != nil {
                        RowData(rowType: .bool, label: "Active", value: String(rocket.active ?? false))
                    } else {
                        RowData(rowType: .bool, label: "Active", value: "")
                    }
                    
                    BlueBox.divider()

                    if let weight = rocket.mass?.kg {
                        RowData(label: "Weight", value: "\(weight.calculator) kg")
                    }
                    if let height = rocket.height?.meters {
                        RowData(label: "Height", value: "\(height.calculator) m")
                    }
                    if let cost = rocket.cost_per_launch {
                        RowData(label: "Launch Cost", value: cost.currencyUS)
                    }
                    if let successRate = rocket.success_rate_pct {
                        RowData(label: "Success rate", value: successRate.percent)
                    }
                    
                    Text("More")
                        .foregroundColor(.blue)
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .onTapGesture {
                            self.showRocketView.toggle()
                        }

                }
                .blueBox()
            }
            .sheet(isPresented: self.$showRocketView, content: {
                RocketView(rocket: rocket)
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

struct RocketInfo_Previews: PreviewProvider {
    static var previews: some View {
        RocketInfo(rocket: RocketModel(id: "123", name: "Name", description: "Description", wikipedia: "", company: "Spacex", first_flight: "", success_rate_pct: 90, cost_per_launch: 2500000, boosters: 1, stages: 2, active: true, type: "type", flickr_images: nil, payload_weights: nil, landing_legs: nil, engines: nil, first_stage: nil, second_stage: nil, height: nil, diameter: nil, mass: nil))
            .previewLayout(.sizeThatFits)
    }
}
