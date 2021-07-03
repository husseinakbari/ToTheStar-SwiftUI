//
//  Engines.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/12/1400 AP.
//

import SwiftUI

struct Engines: View {
    let rocket: RocketModel
    
    var body: some View {
        let engines = rocket.engines
        
        return (
            VStack(spacing: 0) {
                HeaderLabel(title: "Engines")
                
                VStack(spacing: 10) {
                    
                    
                    
                    if let type = engines?.type, let version = engines?.version {
                        RowData(label: "Model", value: "\(type) \(version)".capitalized)
                    }
                    if let layout = engines?.layout {
                        RowData(label: "Layout", value: layout.capitalized)
                    }
                    if let thrust = engines?.thrust_to_weight {
                        RowData(label: "Thrust weight", value: thrust.calculator)
                    }
                    
                    BlueBox.divider()
    
                    if let fuel = engines?.propellant_2 {
                        RowData(label: "Fuel", value: fuel.capitalized)
                    }
                    if let oxidizer = engines?.propellant_1 {
                        RowData(label: "Oxidizer", value: oxidizer.capitalized)
                    }
    
                    BlueBox.divider()
    
                    if let thrustSeaLevel = engines?.thrust_sea_level?.kN {
                        RowData(label: "Sea level thrust", value: "\(thrustSeaLevel) kN")
                    }
                    if let thrustVacuum = engines?.thrust_vacuum?.kN {
                        RowData(label: "Thrust Vacuum", value: "\(thrustVacuum) kN")
                    }
                    
                }.blueBox()
            }
        )
    }
}
