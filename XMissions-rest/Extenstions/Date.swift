//
//  Date.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/9/1400 AP.
//

import Foundation

extension Date {
    static func dateFormatter(time: String, getFormate: String? = "yyyy-MM-dd'T'HH:mm:ss.SSSZ", printFormate: String? = "MMM dd,yyyy HH:mm") -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = getFormate
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = printFormate
        
        if let date = dateFormatterGet.date(from: time) {
            return dateFormatterPrint.string(from: date)
        } else {
            return ""
        }
    }
}
