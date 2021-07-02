//
//  Numeric.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/11/1400 AP.
//

import Foundation

extension Formatter {
    static let number = NumberFormatter()
}
extension Locale {
    static let englishUS: Locale = .init(identifier: "en_US")
    static let frenchFR: Locale = .init(identifier: "fr_FR")
}
extension Numeric {
    private func formatted(with groupingSeparator: String? = nil, style: NumberFormatter.Style, locale: Locale = .current, maxDigit: Int = 0) -> String {
        Formatter.number.locale = locale
        Formatter.number.numberStyle = style
        if let groupingSeparator = groupingSeparator {
            Formatter.number.groupingSeparator = groupingSeparator
        }
        Formatter.number.maximumFractionDigits = maxDigit
        Formatter.number.multiplier = 1.00
        
        return Formatter.number.string(for: self) ?? ""
    }
    // Localized
    var currency:   String { formatted(style: .currency) }
    var percent:    String { formatted(style: .percent) }
    var calculator: String { formatted(with: ",", style: .decimal) }
    // Fixed locales
    var currencyUS: String { formatted(style: .currency, locale: .englishUS) }
    var currencyFR: String { formatted(style: .currency, locale: .frenchFR) }
    
}
