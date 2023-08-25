//
//  ViewExtension.swift
//  NextToGo
//
//  Created by Mamta Devi on 25/8/2023.
//

import Foundation
import SwiftUI

extension View {
    
    /// To remove the animation
    /// - Returns: View
    func withoutAnimation() -> some View{
        self.animation(nil, value:UUID())
    }
}
