//
//  SettingsView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var themeManager =
        ThemeManager()
 

    @State private var showResetAlert =
        false

    var body: some View {

        Form {

            Section(
                "Theme"
            ) {

                Picker(
                    "Appearance",
                    selection:
                        $themeManager
                        .selectedTheme
                ) {

                    Text("System")
                        .tag(
                            AppTheme
                                .system
                                .rawValue
                        )

                    Text("Light")
                        .tag(
                            AppTheme
                                .light
                                .rawValue
                        )

                    Text("Dark")
                        .tag(
                            AppTheme
                                .dark
                                .rawValue
                        )
                }
            }

            Section(
                "Application"
            ) {

                NavigationLink {

                    ExportHistoryView()

                } label: {

                    Label(
                        "Export History",
                        systemImage:
                            "clock.arrow.circlepath"
                    )
                }

                HStack {

                    Text(
                        "Version"
                    )

                    Spacer()

                    Text(
                        "1.0.0"
                    )
                    .foregroundColor(
                        .gray
                    )
                }
            }

            Section(
                "Data"
            ) {

                Button(
                    "Reset All Data",
                    role:
                        .destructive
                ) {

                    showResetAlert =
                        true
                }
            }
        }
        .navigationTitle(
            "Settings"
        )
        .alert(
            "Reset Data",
            isPresented:
                $showResetAlert
        ) {

            Button(
                "Delete",
                role:
                    .destructive
            ) {

                UserDefaults
                    .standard
                    .removeObject(
                        forKey:
                        "saved_resumes"
                    )
            }

            Button(
                "Cancel",
                role:
                    .cancel
            ) {

            }

        } message: {

            Text(
                "Delete all resumes?"
            )
        }
    }
}

#Preview {

    NavigationStack {

        SettingsView()
    }
}
