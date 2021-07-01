//
//  View.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/10/1400 AP.
//

import SwiftUI

struct BlueBox: ViewModifier {
    func body(content: Content) -> some View {
        
        VStack(alignment: .leading) {
            content
                .padding([.top, .bottom], 15)
                .padding([.leading, .trailing], 20)
        }
        .frame(maxWidth: .infinity)
        .background(Color("mid-blue"))
        .cornerRadius(5)
    }
}

extension View {
    func blueBox() -> some View {
        self.modifier(BlueBox())
    }
}
