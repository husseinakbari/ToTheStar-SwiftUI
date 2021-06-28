//
//  HomeView.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/6/1400 AP.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("خانه")
                .font(.yekan(size: 22, weight: .bold))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
