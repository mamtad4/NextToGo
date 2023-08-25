//
//  AppColor.swift
//  NextToGo
//
//  Created by Mamta Devi on 24/8/2023.
//

import Foundation
import SwiftUI

extension Color {
    
    /// Apps color can be changed from here
    enum AppColor: String {
        case black
        case darkGreyBg
        case theme
        case creamBg
    }
    static let theme = Color(AppColor.theme.rawValue)
    static let black = Color(AppColor.black.rawValue)
    static let creamBg = Color(AppColor.creamBg.rawValue)
    static let darkGreyBg = Color(AppColor.darkGreyBg.rawValue)
}
