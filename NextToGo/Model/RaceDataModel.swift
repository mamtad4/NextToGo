//
//  RaceDataModel.swift
//  NextToGo
//
//  Created by Mamta Devi on 23/8/2023.
//

import Foundation

struct RaceDataModel: Identifiable, Codable {
    let id: String
    let raceNumber: Int
    let meetingName: String
    let categoryId: String
    let advertisedStart: AdvertisedStart
    
    
    /// Coding keys to parse data
    enum CodingKeys: String, CodingKey {
        case id = "race_id",
             raceNumber = "race_number",
             meetingName = "meeting_name",
             advertisedStart = "advertised_start",
             categoryId = "category_id"
    }
    
    /// Initialization of RaceDataModel
    /// - Parameters:
    ///   - id: Identifiable
    ///   - raceNumber: Race number
    ///   - meetingName: Meeting name
    ///   - advertisedStart: Advertised Start date
    ///   - categoryId: Category id of type race
    init(id: String = UUID().uuidString,
         raceNumber: Int,
         meetingName: String,
         advertisedStart: AdvertisedStart,
         categoryId: String) {
        self.id = id
        self.raceNumber = raceNumber
        self.meetingName = meetingName
        self.advertisedStart = advertisedStart
        self.categoryId = categoryId
    }
}

extension RaceDataModel {
    
    /// Sample data to show the preview
    static let data = [Self.init(raceNumber: 1,
                                       meetingName: "Prospect Park",
                                       advertisedStart: AdvertisedStart(seconds: 1692758240),
                                 
                                 categoryId: CategoryKeys.horseRacingKey),
                             Self.init(raceNumber: 3,
                                       meetingName: "Redcliff",
                                       advertisedStart: AdvertisedStart(seconds: 1692758940),
                                       categoryId: CategoryKeys.harnessRacingKey),
                             Self.init(raceNumber: 5,
                                       meetingName: "The Gardens",
                                       advertisedStart: AdvertisedStart(seconds: 1692758640),
                                       categoryId: CategoryKeys.horseRacingKey),
                             Self.init(raceNumber: 2,
                                       meetingName: "The Meadows",
                                       advertisedStart: AdvertisedStart(seconds: 1692757940),
                                       categoryId: CategoryKeys.greyhoundRacingKey),
                             Self.init(raceNumber: 4,
                                       meetingName: "The Hoosier Park",
                                       advertisedStart: AdvertisedStart(seconds: 1692756940),
                                       categoryId: CategoryKeys.harnessRacingKey)]
    
    /// Sample data to show the preview
    static let sampleData = [RaceData(category: CategoryKeys.harnessRacingKey, races: data),
                             RaceData(category: CategoryKeys.greyhoundRacingKey, races: data),
                             RaceData(category: CategoryKeys.horseRacingKey, races: data)]
        
}
