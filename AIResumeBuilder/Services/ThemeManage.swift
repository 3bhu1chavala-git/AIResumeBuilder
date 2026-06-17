//
//  ThemeManage.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//

import Foundation
import SwiftUI
import Combine

enum AppTheme: String, CaseIterable {

    case system
    case light
    case dark
}

final class ThemeManager: ObservableObject {

    @Published var selectedTheme: String {

        didSet {

            UserDefaults.standard.set(
                selectedTheme,
                forKey: "selectedTheme"
            )
        }
    }

    init() {

        selectedTheme =
            UserDefaults.standard.string(
                forKey: "selectedTheme"
            ) ??
            AppTheme.system.rawValue
    }

    var colorScheme: ColorScheme? {

        switch AppTheme(
            rawValue: selectedTheme
        ) {

        case .light:
            return .light

        case .dark:
            return .dark

        default:
            return nil
        }
    }
}
