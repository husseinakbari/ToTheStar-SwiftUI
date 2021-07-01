//
//  CompanyView.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/6/1400 AP.
//

import SwiftUI

struct CompanyView: View {
    @EnvironmentObject var contentVM: ContentVM
    
    init() {
        print("Init Company")
    }
    var body: some View {
        
        ZStack {
            Color("navy-blue").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Company")
                    .foregroundColor(.white)
            }
            
        }        
    }
}

struct CompanyView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyView()
            .environmentObject(ContentVM())
    }
}
