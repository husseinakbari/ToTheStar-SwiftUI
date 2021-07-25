//
//  Models.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/6/1400 AP.
//

import SwiftUI
import MapKit

struct CustomAlertModel {
    var show: Bool
    let title: String
    let message: String
    let primaryButton: Alert.Button
    let secondaryButton: Alert.Button
}

struct TabItemModel {
    let image: UIImage?
    let tag:   TabItemsTag
}

enum TabItemsTag {
    case home
    case upcoming
    case company
    case past
}

struct Coordinate: Identifiable {
    let id = UUID()
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    let tint: Color
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
