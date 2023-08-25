//
//  NextToGoApp.swift
//  NextToGo
//
//  Created by Mamta Devi on 23/8/2023.
//

import SwiftUI

@main
struct NextToGoApp: App {
    @StateObject var raceViewModel = RaceViewModel()
    var body: some Scene {
        WindowGroup {
            RacingListView(raceList: $raceViewModel.results,
                           filters: $raceViewModel.raceCategoryFilter,
                           reloadData: {
                Task {
                    await fetchData()
                }
            })
                .task {
                    await fetchData()
                }
                .refreshable {
                    await fetchData()
                }
        }
    }
    func fetchData() async {
        do {
            try await raceViewModel.loadData()
        } catch {
            print(error.localizedDescription)
        }
    }
}
