//
//  RowData.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/11/1400 AP.
//

import SwiftUI

struct RowData: View {
    let rowType: RowType
    let label: String
    let value: String
    
    enum RowType {
        case bool
        case string
        case link
    }
    
    init(rowType: RowType = .string , label: String, value: String) {
        self.rowType = rowType
        self.label = label
        self.value = value
    }
    
    private func rowDataView() -> AnyView {
        switch rowType {
        case .bool:
            if value == "true" {
                return AnyView(
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                        .frame(width: 20, height: 20, alignment: .center)
                )
            } else if value == "false" {
                return AnyView(
                    Image(systemName: "xmark.circle")
                        .foregroundColor(.red)
                        .frame(width: 20, height: 20, alignment: .center)
                )
            } else {
                return AnyView(
                    Image(systemName: "questionmark.circle")
                        .foregroundColor(.gray)
                        .frame(width: 20, height: 20, alignment: .center)
                )
            }
            
            
        case .link:
            return AnyView(
                Link(destination: URL(string: value)!, label: {
                    Image(systemName: "link")
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20, alignment: .center)
                })
            )
            
        default:
            return AnyView(
                Text(self.value.isEmpty ? "Unknown" : self.value)
                    .foregroundColor(Color("light-gray"))
                    .font(.system(size: 14, weight: .medium, design: .rounded))
            )
        }
        
        
    }
    
    
    var body: some View {
        HStack {
            Text(self.label)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
            
            Spacer()
            
            
            rowDataView()
        }
    }
}
