//
//  Util.swift
//  Awkward Silence
//
//  Created by Jan Baumann on 14.09.21.
//

import SwiftUI

class Util {
    static func getBackgroundColor(darkModeEnabled: Bool) -> some View {
        if darkModeEnabled {
            return Color.init(red: 84 / 255, green: 82 / 255, blue: 83 / 255).ignoresSafeArea()
        } else {
            return Color.init(red: 230 / 255, green: 238 / 255, blue: 255 / 255).ignoresSafeArea()
        }
    }
}

