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
    let bool: Bool
    
    enum RowType {
        case bool
        case string
    }
    
    init(rowType: RowType = .string , label: String, value: String, bool: Bool = false) {
        self.rowType = rowType
        self.label = label
        self.value = value
        self.bool = bool
    }
    
    
    
    var body: some View {
        HStack {
            Text(self.label)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
            
            Spacer()
            
            if rowType == .string {
                Text(self.value.isEmpty ? "Unknown" : self.value)
                    .foregroundColor(Color("light-gray"))
                    .font(.system(size: 14, weight: .medium, design: .rounded))
            } else if rowType == .bool {
                if bool {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                        .frame(width: 20, height: 20, alignment: .center)
                } else {
                    Image(systemName: "xmark.circle")
                        .foregroundColor(.red)
                        .frame(width: 20, height: 20, alignment: .center)
                }
                
            }
        }
    }
}
