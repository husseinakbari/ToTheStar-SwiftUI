//
//  Stages.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/12/1400 AP.
//

import SwiftUI

struct Stages: View {
    let rocket: RocketModel
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderLabel(title: "Stages")
            
            VStack(spacing: 10) {
                
                if let fristStage = rocket.first_stage {
                    
                    if let thrust = fristStage.thrust_sea_level {
                        RowData(label: "Frist stage thrust", value: "\(thrust.kN?.calculator ?? "") kN")
                    }
                    if let fuel = fristStage.fuel_amount_tons {
                        RowData(label: "Fuel amount", value: "\(fuel.calculator) tons")
                    }
                    if let engines = fristStage.engines {
                        RowData(label: "Engines", value: "\(engines)")
                    }
                    if fristStage.reusable != nil {
                        RowData(rowType: .bool, label: "Reusable", value: String(fristStage.reusable ?? false))
                    } else {
                        RowData(rowType: .bool, label: "Reusable", value: "")
                    }
                    
                }
                
                if let secondStage = rocket.second_stage {
                    BlueBox.divider()
                    
                    if let thrust = secondStage.thrust_sea_level {
                        RowData(label: "Frist stage thrust", value: "\(thrust.kN?.calculator ?? "") kN")
                    }
                    if let fuel = secondStage.fuel_amount_tons {
                        RowData(label: "Fuel amount", value: "\(fuel.calculator) tons")
                    }
                    if let engines = secondStage.engines {
                        RowData(label: "Engines", value: "\(engines)")
                    }
                    if secondStage.reusable != nil {
                        RowData(rowType: .bool, label: "Reusable", value: String(secondStage.reusable ?? false))
                    } else {
                        RowData(rowType: .bool, label: "Reusable", value: "")
                    }
                    
                }
        
            }.blueBox()
        }
    }
}
