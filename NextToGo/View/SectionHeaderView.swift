//
//  SectionHeaderView.swift
//  NextToGo
//
//  Created by Mamta Devi on 23/8/2023.
//

import SwiftUI

struct SectionHeaderView: View {
    let raceCategory: RaceCategory
    var body: some View {
        
        VStack(spacing: 0) {
            HStack {
                Text(raceCategory.rawValue)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding([.top,.bottom], 15)
                    .padding([.leading,.trailing],10)
                    .accessibilityAddTraits(.isHeader)
                Spacer()
            }
            .accessibilityElement(children: .combine)
        }
        .background(Color.darkGreyBg)
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(raceCategory: RaceCategory.horse)
    }
}
