//
//  Tools.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/6/1400 AP.
//

import SwiftUI

struct Tools {
    static func currencyFormate(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 0
        formatter.numberStyle = .currency
        
        if let amount = formatter.string(from: value as NSNumber) {
            return amount
        } else {
            return ""
        }
    }
    
    static func dateFormatter(time: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy HH:mm"
        
        if let date = dateFormatterGet.date(from: time) {
            return dateFormatterPrint.string(from: date)
        } else {
            return ""
        }
    }

    static let loremIpsum: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries."
    
    static let defaultImage = UIImage(systemName: "exclamationmark.triangle")!
}

