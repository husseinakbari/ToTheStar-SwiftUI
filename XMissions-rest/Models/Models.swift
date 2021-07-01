//
//  Models.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/6/1400 AP.
//

import SwiftUI

struct CustomAlertModel {
    var show: Bool
    let title: String
    let message: String
    let primaryButton: Alert.Button
    let secondaryButton: Alert.Button
}

struct TabItemModel {
    let label: String
    let image: UIImage?
    let tag:   TabItemsTag
}

enum TabItemsTag {
    case home
    case upcoming
    case company
}

struct AssetsImages: Identifiable {
    let id = UUID()
    let image: Image
}

extension AssetsImages {
    static func missions() -> [AssetsImages] {
        return [
            AssetsImages(image: Image("mission-1")),
            AssetsImages(image: Image("mission-2")),
            AssetsImages(image: Image("mission-3")),
            AssetsImages(image: Image("mission-4")),
            AssetsImages(image: Image("mission-5")),
            AssetsImages(image: Image("mission-6")),
        ]
    }
}
