//
//  ContentView.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/5/1400 AP.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var contentVM: ContentVM
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(Color.white),
//            .font: UIFont.systemFont(ofSize: 26, weight: .bold)
        ]
    }
        
    var body: some View {
        ZStack {
            Color("light-gray").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                
                ZStack {
                    switch self.contentVM.tabBarSelection {
                    case .home:
                        HomeView()
                    case .upcoming:
                        UpcomingList()
                    case .company:
                        CompanyView()
                    case .past:
                        PastList()
                    }
                }
            
                TabBarView()
    
            }
                
            
        }
        .preferredColorScheme(.dark)
        .ignoresSafeArea(.all, edges: [.bottom, .top])
        .alert(isPresented: $contentVM.customAlert.show, content: {
            Alert(
                title: Text(contentVM.customAlert.title),
                message: Text(contentVM.customAlert.message),
                primaryButton: contentVM.customAlert.primaryButton,
                secondaryButton: contentVM.customAlert.secondaryButton
            )
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentVM())
            .environmentObject(BackgroundVM())
    }
}
