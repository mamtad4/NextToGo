//
//  AdvertisedStart.swift
//  NextToGo
//
//  Created by Mamta Devi on 23/8/2023.
//

import Foundation

/// Structure to manage all the date and time relates data
struct AdvertisedStart: Codable {
    let seconds: Int
    
    enum CodingKeys: CodingKey {
        case seconds
    }
    
    /// Advertised Seconds
    /// - Parameter seconds: Seconds
    init(seconds: Int) {
        self.seconds = seconds
    }
    
    /// Remaining time of race to get started
    var remainingTime: String {
        get {
            let remainingTime = seconds - Date()
            var timeStr = ""
            if let hour = remainingTime.hours,
               hour != 0 {
                timeStr = timeStr.appending("\(hour)h ")
            }
            if let minutes = remainingTime.minutes,
               minutes != 0 {
                timeStr = timeStr.appending("\(minutes)m ")
            }
            if let minutes = remainingTime.minutes,
               minutes <= 2,
               let seconds = remainingTime.seconds,
               seconds != 0 {
                timeStr = timeStr.appending("\(seconds)s")
            }
            return timeStr
        }
    }
    
    var timeInSeconds: Int {
        let lhsDate = Date.init(timeIntervalSince1970: TimeInterval(seconds))
        return Calendar.current.dateComponents([.second], from: min(Date(),lhsDate), to: max(Date(),lhsDate)).second ?? 0
    }
}

extension Date {
    
    /// To find the date difference
    /// - Parameters:
    ///   - lhs: seconds when race will be start
    ///   - rhs: current time
    /// - Returns: Tuple of hours, minutes, seconds
    static func -(lhs: Int, rhs: Date) -> (hours:Int?,
                                           minutes:Int?,
                                           seconds:Int?) {
        let lhsDate = Date.init(timeIntervalSince1970: TimeInterval(lhs))
        let time = Calendar.current.dateComponents([.hour,.minute,.second], from: rhs, to: lhsDate)
        return (hours: time.hour,
                minutes: time.minute,
                seconds: time.second)
    }
}
