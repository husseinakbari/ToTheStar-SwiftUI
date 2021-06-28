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
}
