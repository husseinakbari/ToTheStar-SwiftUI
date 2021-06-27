//
//  NetworkModel.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/6/1400 AP.
//

import Foundation

enum ErrorTypes {
    case none
    case network
}

struct HistoryModel: Codable {
    let id: Int
    let title: String?
    let event_date_utc: String?
    let flight_number: Int?
    let details: String?
    let links: LinksModel?
}

struct HistoryQuery: Codable {
    let id: Int
}

struct LinksModel: Codable {
    let reddit: String?
    let article: String?
    let wikipedia: String?
}
