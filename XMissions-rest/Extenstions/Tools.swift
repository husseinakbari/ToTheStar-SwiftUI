//
//  Tools.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/6/1400 AP.
//

import SwiftUI

struct Tools {
    static let loremIpsum: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries."
    
    static let defaultImage = UIImage(systemName: "exclamationmark.triangle")!
    
    static func missionsImages() -> [Image] {
        
        var images = [Image]()
        
        for index in 1...5 {
            images.append(Image("mission-\(index)"))
        }
        
        return images
    }
    
    static func companyImages() -> [Image] {
        
        var images = [Image]()
        
        for index in 1...4 {
            images.append(Image("company-\(index)"))
        }
        
        return images
    }
}
