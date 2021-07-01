//
//  ImageSlider.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/10/1400 AP.
//

import SwiftUI

struct ImageSliderView: View {
    @State private var currentIndex = Int.random(in: 0...5)
    private let images = AssetsImages.missions()
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(1..<7) { num in
                Image("mission-\(num)")
                    .resizable()
                    .scaledToFit()
                    .tag(num)

            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(maxWidth: .infinity, minHeight: 260)
        .onReceive(timer, perform: { _ in
            withAnimation {
                currentIndex = currentIndex < 6 ? currentIndex + 1 : 0
            }
        })
    }
}
