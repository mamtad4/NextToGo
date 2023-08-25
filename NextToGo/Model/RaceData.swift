//
//  RaceData.swift
//  NextToGo
//
//  Created by Mamta Devi on 24/8/2023.
//

import Foundation

/// Race list for each category
struct RaceData: Identifiable {
    let id: UUID
    let category: String
    var races: [RaceDataModel]
    
    /// Initialization of Race
    /// - Parameters:
    ///   - id: Identifiable
    ///   - category: Category Id
    ///   - races: Array of races
    init(id: UUID = UUID(),category: String, races: [RaceDataModel]) {
        self.category = category
        self.races = races
        self.id = id
    }
}
