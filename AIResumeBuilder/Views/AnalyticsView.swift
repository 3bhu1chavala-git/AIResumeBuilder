//
//  AnalyticsView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//

import SwiftUI

struct AnalyticsView: View {

    @State private var totalResumes = 0
    @State private var totalExports = 0
    @State private var averageATS = 0
    @State private var totalShares = 0
    @State private var mostUsedTemplate = ""

    var body: some View {

        List {

            Section(
                "Resume Analytics"
            ) {

                analyticsRow(
                    title:
                        "Total Resumes",
                    value:
                        "\(totalResumes)"
                )

                analyticsRow(
                    title:
                        "Total Exports",
                    value:
                        "\(totalExports)"
                )

                analyticsRow(
                    title:
                        "Total Shares",
                    value:
                        "\(totalShares)"
                )

                analyticsRow(
                    title:
                        "Average ATS",
                    value:
                        "\(averageATS)"
                )

                analyticsRow(
                    title:
                        "Top Template",
                    value:
                        mostUsedTemplate
                )
            }
        }
        .navigationTitle(
            "Analytics"
        )
        .onAppear {

            loadData()
        }
    }

    private func analyticsRow(
        title: String,
        value: String
    ) -> some View {

        HStack {

            Text(title)

            Spacer()

            Text(value)
                .bold()
        }
    }

    private func loadData() {

        totalResumes =
            ResumeAnalyticsService
            .shared
            .totalResumes()

        totalExports =
            ResumeAnalyticsService
            .shared
            .totalExports()

        averageATS =
            ResumeAnalyticsService
            .shared
            .averageATSScore()

        totalShares =
            ResumeAnalyticsService
            .shared
            .totalShares()

        mostUsedTemplate =
            ResumeAnalyticsService
            .shared
            .mostUsedTemplate()
    }
}

#Preview {

    NavigationStack {

        AnalyticsView()
    }
}
