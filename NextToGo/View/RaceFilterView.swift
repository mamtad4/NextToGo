//
//  RaceFilterView.swift
//  NextToGo
//
//  Created by Mamta Devi on 23/8/2023.
//

import SwiftUI

struct RaceFilterView: View {
    @Binding var filters: [RaceFilter]
    var reloadData: (()->Void)
    var body: some View {
        HStack {
            ForEach($filters) { $filter in
                FilterButtonView(filter: $filter,
                                 reloadData: reloadData)
            }
        }
        .padding([.leading,.trailing],20)
        .background(Color.creamBg)
    }
}

struct RaceFilterView_Previews: PreviewProvider {
    static var previews: some View {
        RaceFilterView(filters: .constant(RaceFilter.raceCategoryFilter),
                       reloadData: {})
    }
}
