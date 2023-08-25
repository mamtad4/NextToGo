//
//  RaceFilter.swift
//  NextToGo
//
//  Created by Mamta Devi on 24/8/2023.
//

import Foundation

struct RaceFilter: Identifiable {
    let id: UUID
    var raceCategory: RaceCategory
    var isSelected: Bool
    
    /// Set default filters
    /// - Parameters:
    ///   - id: Identifiable
    ///   - raceCategory: Race category type
    ///   - isSelected: filter is selected or not
    init(id: UUID = UUID(),
         raceCategory: RaceCategory,
         isSelected: Bool = true) {
        self.isSelected = isSelected
        self.id = id
        self.raceCategory = raceCategory
    }
}

extension RaceFilter {
    
    /// Default filters data
    static var raceCategoryFilter = [RaceFilter(raceCategory: .horse),
                                     RaceFilter(raceCategory: .greyhound),
                                     RaceFilter(raceCategory: .harness)]
}
