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
    let links: LinksModel
}

struct HeadquartersModel: Codable {
    let address: String
    let city: String
    let state: String
}

struct LinksModel: Codable {
    let website: String
    let flickr: String
    let twitter: String
    let elon_twitter: String
}
