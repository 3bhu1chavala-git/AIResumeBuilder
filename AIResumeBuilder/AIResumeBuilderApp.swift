//
//  AIResumeBuilderApp.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//
import SwiftUI

@main
struct AIResumeBuilderApp: App {

    @StateObject private var themeManager =
        ThemeManager()

    var body: some Scene {

        WindowGroup {

            HomeView()
                .preferredColorScheme(
                    themeManager.colorScheme
                )
        }
    }
}
