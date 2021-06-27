//
//  ContentView.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/5/1400 AP.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var contentVM: ContentVM
        
    var body: some View {
        ZStack {
            Color("navy-blue").edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                ZStack {
                    switch self.contentVM.tabBarSelection {
                    case 0:
                        HomeView()
                    case 1:
                        CompanyView()
                    default:
                        EmptyView()
                    }
                }
                
                Spacer()
                
                TabBarView()
            }
                
            
        }
        .ignoresSafeArea(.all, edges: [.bottom, .top])
        .alert(isPresented: self.$contentVM.customAlert.isShow, content: {
            Alert(
                title: Text(contentVM.customAlert.title),
                message: Text(contentVM.customAlert.message ?? ""),
                primaryButton: contentVM.customAlert.primaryButton ?? .default(Text("Got it")),
                secondaryButton: contentVM.customAlert.secondaryButton ?? .default(Text("Got it"))
            )
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentVM())
    }
}
