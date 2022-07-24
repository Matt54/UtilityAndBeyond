//
//  EnvironmentValues+Extensions.swift
//  
//
//  Created by Matt Pfeiffer on 7/24/22.
//

import SwiftUI

public extension EnvironmentValues {
    var isPreview: Bool {
        #if DEBUG
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
        #else
        return false
        #endif
    }
}
