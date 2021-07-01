//
//  HomeView.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/6/1400 AP.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        print("Init HOME")
    }
    
    var body: some View {
        ZStack {
            Color("navy-blue").edgesIgnoringSafeArea(.all)
            
            Text("Home View dsfdsffs")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
