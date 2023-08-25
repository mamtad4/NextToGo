//
//  FilterButtonView.swift
//  NextToGo
//
//  Created by Mamta Devi on 25/8/2023.
//

import SwiftUI

struct FilterButtonView: View {
    @Binding var filter: RaceFilter
    var reloadData: (()->Void)

    var body: some View {
        HStack {
            Button(action: {
                filter.isSelected = !filter.isSelected
                reloadData()
            }){
                withAnimation {
                    Image(systemName: filter.isSelected ? "checkmark.square.fill" : "square")
                        .foregroundColor(.orange)
                }
            }
            .accessibilityLabel("Select or deselect \(filter.raceCategory.rawValue.lowercased())")
            Image(filter.raceCategory.rawValue.lowercased().components(separatedBy: " ").first ?? "horse" )
            if filter.raceCategory != .harness {
                Spacer()
            }
        }
    }
}

struct FilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonView(filter: .constant(RaceFilter.raceCategoryFilter[0]),
                         reloadData: {})
    }
}
