//
//  Date.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/9/1400 AP.
//

import Foundation

extension Date {
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
}
