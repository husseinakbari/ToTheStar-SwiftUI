//
//  Specifications.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/12/1400 AP.
//

import SwiftUI

struct Specifications: View {
    let rocket: RocketModel
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderLabel(title: "Specifications")
            
            VStack(spacing: 10) {
                
                if let stages = rocket.stages {
                    RowData(label: "Stages", value: String(stages))
                }
                if let boosters = rocket.boosters {
                    RowData(label: "Boosters", value: String(boosters))
                }
                
                BlueBox.divider()
                
                if let weight = rocket.mass?.kg {
                    RowData(label: "Weight", value: "\(weight.calculator) kg")
                }
                if let height = rocket.height?.meters {
                    RowData(label: "Height", value: "\(height.calculator) m")
                }
                if let diameter = rocket.diameter?.meters {
                    RowData(label: "Diameter", value: "\(diameter.calculator) m")
                }
                
                BlueBox.divider()
                
                if let landingLeg = rocket.landing_legs?.number {
                    RowData(label: "Landing legs", value: "\(landingLeg.calculator)")
                }
                if let material = rocket.landing_legs?.material {
                    RowData(label: "Material", value: material)
                }
                
                
                
            }.blueBox()
        }
    }
}

