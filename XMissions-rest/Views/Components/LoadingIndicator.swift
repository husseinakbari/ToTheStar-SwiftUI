//
//  LoadingIndicator.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/30/1400 AP.
//

import SwiftUI

struct LoadingIndicator: View {
    @State private var isLoading = false
    let size: CGFloat
    let color: Color
    
    init(size: CGFloat = 50, color: Color = Color("navy-blue")) {
        self.size = size
        self.color = color
    }
    
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 10)
                .frame(width: size, height: size)

            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(color, lineWidth: 7)
                .frame(width: size, height: size)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .onAppear() {
                    self.isLoading = true
            }
        }
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
    }
}
