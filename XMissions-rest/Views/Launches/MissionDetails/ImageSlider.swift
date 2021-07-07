//
//  ImageSlider.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/10/1400 AP.
//

import SwiftUI

struct ImageSliderView: View {
    @State private var selection: Int = 0
    private var images = [Image]()
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    init(images: [Image]) {
        self.images = images
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(0..<images.count) { index in
                images[index]
                    .resizable()
                    .scaledToFit()
                    .tag(index)

            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(width: UIScreen.main.bounds.width, height: 260)
        .onReceive(timer, perform: { _ in
            withAnimation {
                selection = selection < images.count ? selection + 1 : 0
            }
        })
    }
}

struct ImageSliderView2: View {
    @State private var selection: Int = 0
    @State private var isLoading: Bool
    private var images = [Data]()
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    init(images: [Data], loading: Bool = false) {
        self.images = images
        self.isLoading = loading
    }
    
    var body: some View {
        if isLoading {
            VStack(alignment: .center) {
                Image(systemName: "photo")
                    .font(.system(size: 40))
                    .foregroundColor(Color("background"))
            }
            .frame(width: UIScreen.main.bounds.width, height: 260)
            .background(Color("dark-gray"))
        } else {
            TabView(selection: $selection) {
                ForEach(0..<images.count) { index in
                    Image(uiImage: UIImage(data: images[index])!)
                        .resizable()
                        .scaledToFit()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(width: UIScreen.main.bounds.width, height: 260)
            .onReceive(timer, perform: { _ in
                withAnimation {
                    selection = selection < images.count ? selection + 1 : 0
                }
            })
        }
        

        
    }
    
}
