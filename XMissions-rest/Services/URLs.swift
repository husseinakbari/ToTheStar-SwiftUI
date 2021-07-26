//
//  URLs.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/6/1400 AP.
//

import Foundation

private let baseUrl = "https://api.spacexdata.com/v4"

struct URLs {
    static let company = "\(baseUrl)/company"
    static let upcomingLaunches = "\(baseUrl)/launches/upcoming"
    static let rockets = "\(baseUrl)/rockets"
    static let pastLaunche = "\(baseUrl)/launches/past"
    static let launchpads = "\(baseUrl)/launchpads"
    static let nextLaunch = "\(baseUrl)/launches/next"
}
