//
//  RaceCategory.swift
//  NextToGo
//
//  Created by Mamta Devi on 23/8/2023.
//

import Foundation

enum RaceCategory: String, CaseIterable, Identifiable {
    case horse = "Horse Racing"
    case greyhound = "Greyhound Racing"
    case harness = "Harness Racing"
    case none = "All"
    
    /// Returns the rawValue of enum type
    var id: String {
        rawValue
    }
    
    /// Get category for each Race type
    var categoryId: String {
        switch self {
        case .horse:
            return CategoryKeys.horseRacingKey
        case .greyhound:
            return CategoryKeys.greyhoundRacingKey
        case .harness:
            return CategoryKeys.harnessRacingKey
        case .none:
            return ""
        }
    }
    
    /// Description
    /// - Parameter str: category id
    /// - Returns: Race category enum
    static func getProperty(str: String) -> Self {
        switch str {
        case CategoryKeys.horseRacingKey:
            return .horse
        case CategoryKeys.greyhoundRacingKey:
            return .greyhound
        case CategoryKeys.harnessRacingKey:
            return .harness
        default:
            return .none
        }
    }
    
}
