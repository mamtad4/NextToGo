//
//  RacingListView.swift
//  NextToGo
//
//  Created by Mamta Devi on 23/8/2023.
//

import SwiftUI

struct RacingListView: View {
    @Binding var raceList: [RaceData]
    @Binding var filters: [RaceFilter]
    var reloadData: (()->Void)
    
    /// View for showing list of arrays
    var body: some View {
        NavigationStack {
            RaceFilterView(filters: $filters, reloadData: reloadData)
            Spacer(minLength: 0)
            List {
                ForEach($raceList) { $race in
                    Section(header: SectionHeaderView(raceCategory: RaceCategory.getProperty(str: race.category))) {
                        ForEach($race.races) { $raceData in
                            RaceCellView(raceData: $raceData,reloadData:reloadData)
                                .padding([.top,
                                          .bottom,
                                          .leading,
                                          .trailing],10)
                        }
                    }
                }
                .listRowInsets(EdgeInsets())
            }
            .animation(.default, value: UUID())
            .navigationTitle(Text("Racing"))
            .toolbarBackground(Color.theme,
                               for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
    }
}

struct RacingListView_Previews: PreviewProvider {
    /// Preview to show racing list
    static var previews: some View {
        RacingListView(raceList: .constant(RaceDataModel.sampleData),
                       filters: .constant(RaceFilter.raceCategoryFilter), reloadData: {})
    }
}
