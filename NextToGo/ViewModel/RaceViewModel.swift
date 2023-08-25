//
//  NetworkManager.swift
//  NextToGo
//
//  Created by Mamta Devi on 23/8/2023.
//

import Foundation

@MainActor
final class RaceViewModel: ObservableObject {
    
    
    private var isLoading = false
    @Published var results: [RaceData] = []
    @Published var raceCategoryFilter = RaceFilter.raceCategoryFilter
    
    /// Fetch all races data
    /// - Parameter count: count to get limited data
    func loadData(count:Int = 50) async throws {
        guard !isLoading else {
            return
        }
        isLoading = true
        let task = Task<ResponseModel, Error> {
            let urlStr = "\(Url.baseUrl)\(Url.version)\(API.type)?method=\(API.method)&count=\(count)"
            guard let url = URL(string: urlStr) else {
                return ResponseModel(data: RaceResultModel(raceSummaries: [:]))
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(ResponseModel.self, from: data)
        }
        let response = try await task.value
        DispatchQueue.main.async { [weak self] in
            self?.filterData(response: response.data.raceSummaries)
            self?.isLoading = false
        }
    }
    
    /// Filter the response array corresponding to specific category
    /// - Parameter response: response consists all races data
    func filterData(response: [String:RaceDataModel]) {
        results.removeAll()
        let categories = raceCategoryFilter.filter({$0.isSelected}).map { $0.raceCategory.categoryId }
        let array = response.values.sorted(by: {$0.advertisedStart.seconds < $1.advertisedStart.seconds})
        if categories.isEmpty {
            results.append(RaceData(category: "All", races: array.maximumElement(max: 5)))
        } else {
            for category in categories {
                let array = response.values.filter({$0.categoryId == category}).sorted(by: {$0.advertisedStart.seconds < $1.advertisedStart.seconds})
                if array.count > 0 {
                    results.append(RaceData(category: category, races: array.maximumElement(max: 5)))
                }
            }
        }
        if let recentRace = array.first {
            refreshDataAfterOneMinute(recentRace: recentRace)
        }
    }
    
    /// Refresh data after 1 minute past the data and disappear the race which is started
    /// - Parameter recentRace: the most recent race which is goint to start
    func refreshDataAfterOneMinute(recentRace: RaceDataModel) {
        let workTime = DispatchWorkItem { [weak self] in
            Task {
                try await self?.loadData()
            }
        }
        print("time:\(recentRace.advertisedStart.timeInSeconds+60)")
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(recentRace.advertisedStart.timeInSeconds+60) , execute: workTime)
    }
}
