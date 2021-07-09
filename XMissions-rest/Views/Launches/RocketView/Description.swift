//
//  Description.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/12/1400 AP.
//

import SwiftUI

struct Description: View {
    let rocket: RocketModel
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderLabel(title: "Description")
            
            VStack(alignment: .leading, spacing: 10) {
                if let company = rocket.company {
                    RowData(label: "Company", value: company)
                }
                if let firstFlight = rocket.first_flight {
                    RowData(label: "Frist launch", value: Date.dateFormatter(time: firstFlight))
                }
                if let costLaunch = rocket.cost_per_launch {
                    RowData(label: "Launch cost", value: costLaunch.currencyUS)
                }
                if let successRate = rocket.success_rate_pct {
                    RowData(label: "Success rate", value: successRate.percent)
                }
                if rocket.active != nil {
                    RowData(rowType: .bool, label: "Active", value: String(rocket.active ?? false))
                } else {
                    RowData(rowType: .bool, label: "Active", value: "")
                }
                
                if let wikipedia = rocket.wikipedia {
                    Link("More...", destination: URL(string: wikipedia)!)
                        .foregroundColor(.blue)
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                }
                
                if let desc = rocket.description {
                    BlueBox.divider()
                    Text(desc)
                        .foregroundColor(Color("light-gray"))
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                
            }.blueBox()
        }
    }
}
