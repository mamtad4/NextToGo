//
//  RaceResultModel.swift
//  NextToGo
//
//  Created by Mamta Devi on 23/8/2023.
//

import Foundation

/// Intial Response
struct ResponseModel: Codable {
    let data: RaceResultModel
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

/// Race summries data
struct RaceResultModel: Codable {
    let raceSummaries: [String: RaceDataModel]
    enum CodingKeys: String, CodingKey {
        case raceSummaries = "race_summaries"
    }
}
