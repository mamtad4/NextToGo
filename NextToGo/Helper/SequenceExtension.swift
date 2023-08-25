//
//  SequenceExtension.swift
//  NextToGo
//
//  Created by Mamta Devi on 25/8/2023.
//

import Foundation

extension Sequence {
    
    /// To get the maximum element of arrays
    /// - Parameter max: Limit of maximum arrays
    /// - Returns: Array of sequence
    func maximumElement(max: Int) -> [Element] {
        return self.enumerated().filter({$0.offset < max}).map({$0.element})
    }
}


