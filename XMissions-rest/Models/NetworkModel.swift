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
// MARK: - Rockets Response
struct RocketModel: Codable {
    let id: String?
    let name: String?
    let description: String?
    let wikipedia: String?
    let company: String?
    let first_flight: String?
    let success_rate_pct: Int?
    let cost_per_launch: Double?
    let boosters: Int?
    let stages: Int?
    let active: Bool?
    let type: String?
    let flickr_images: [String]?
    let payload_weights: [PayloadWeightsModel]?
    let landing_legs: LandingLegsModel?
    let engines: EngineMdoel?
    let first_stage: StageModel?
    let second_stage: StageModel?
    let height: LongModel?
    let diameter: LongModel?
    let mass: WeightModel?
}

struct LandingLegsModel: Codable {
    let number: Int?
    let material: String?
}

struct PayloadWeightsModel: Codable {
    let id: String?
    let name: String?
    let kg: Double?
    let lb: Double?
}

struct EngineMdoel: Codable {
    let number: Int?
    let type: String?
    let version: String?
    let layout: String?
    let engine_loss_max: Int?
    let propellant_1: String?
    let propellant_2: String?
    let thrust_to_weight: Float?
    let thrust_sea_level: ThrustModel?
    let thrust_vacuum: ThrustModel?
    let isp: ISPModel?
}

struct StageModel: Codable {
    let thrust_sea_level: ThrustModel?
    let thrust_vacuum: ThrustModel?
    let reusable: Bool?
    let engines: Int?
    let fuel_amount_tons: Int?
    let burn_time_sec: Int?
}

struct ThrustModel: Codable {
    let kN: Double?
    let lbf: Double?
}

struct ISPModel: Codable {
    let sea_level: Int?
    let vacuum: Int?
}

struct LongModel: Codable {
    let meters: Float?
    let feet: Float?
}

struct WeightModel: Codable {
    let kg: Double?
    let lb: Double?
}
