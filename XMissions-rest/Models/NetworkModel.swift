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
// MARK: - Comapny Response
struct CompanyModel: Codable {
    let name: String
    let founder: String
    let founded: Int
    let employees: Int
    let ceo: String
    let cto: String
    let coo: String
    let valuation: Double
    let summary: String
    let headquarters: HeadquartersModel
    let links: CompanyLinksModel
}

struct HeadquartersModel: Codable {
    let address: String
    let city: String
    let state: String
}

struct CompanyLinksModel: Codable {
    let website: String
    let flickr: String
    let twitter: String
    let elon_twitter: String
}
// MARK: - Launches Response
struct LaunchModel: Codable, Identifiable {
    let id: String
    let name: String?
    let flight_number: Int?
    let date_utc: String?
    let success: Bool?
    let links: LauncheLinkModel?
    let details: String?
    let rocket: String?
}

struct LauncheLinkModel: Codable {
    let patch: PatchModel?
    let reddit: RedditModel?
    let webcast: String?
    let article: String?
    let wikipedia: String?
}

struct PatchModel: Codable {
    let small: String?
    let large: String?
}

struct RedditModel: Codable {
    let campaign: String?
    let launch: String?
    let media: String?
    let recovery: String?
}
