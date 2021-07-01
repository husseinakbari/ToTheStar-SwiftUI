//
//  LabelDivider.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/10/1400 AP.
//

import SwiftUI

struct LabelDivider: View {
    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 0, color: Color = Color("dark-gray")) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label)
                .foregroundColor(color)
                .font(.system(size: 14, weight: .medium, design: .rounded))
            line
        }
    }

    var line: some View {
        VStack {
            Divider()
                .background(color)
        }
        .padding(horizontalPadding)
    }
}

struct LabelDivider_Previews: PreviewProvider {
    static var previews: some View {
        LabelDivider(label: "Label")
    }
}
