//
//  RaceCellView.swift
//  NextToGo
//
//  Created by Mamta Devi on 23/8/2023.
//

import SwiftUI

struct RaceCellView: View {
    @Binding var raceData: RaceDataModel
    @State private var timeRemaining: String?
    var timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    var reloadData: (()->Void)

    var body: some View {
        ZStack{
            HStack {
                Text(raceData.meetingName)
                    .font(.subheadline)
                Spacer()
                HStack {
                    Text(timeRemaining == nil ? raceData.advertisedStart.remainingTime: timeRemaining ?? "")
                        .font(.caption)
                        .onReceive(timer) { time in
                          // timeRemaining = raceData.advertisedStart.remainingTime
                        }
                        .withoutAnimation()
                    Circle()
                        .strokeBorder(lineWidth: 1.0)
                        .frame(width: 40, height: 40)
                        .overlay {
                            Text("R\(raceData.raceNumber)")
                                .font(.custom("Helvetica Neue", size: 16, relativeTo: .largeTitle))
                        }
                }
            }
        }
    }
}

struct RaceCellView_Previews: PreviewProvider {
    static var previews: some View {
        RaceCellView(raceData: .constant(RaceDataModel.data[0]),
                     reloadData: {})
    }
}
