//
//  ContentVM.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/5/1400 AP.
//

import Foundation
import Combine

class ContentVM: ObservableObject {
    
    init() {
        getInitialData()
    }
    
    private func getInitialData() {
        print("Get Inital")
    }
}
