//
//  ContentView.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/5/1400 AP.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var contentVM: ContentVM
    
    init() {
        self.contentVM = ContentVM()
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
