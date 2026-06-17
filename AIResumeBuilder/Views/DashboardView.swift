//
//  DashboardView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//
import SwiftUI

struct DashboardView: View {

    @State private var totalResumes = 0
    @State private var totalExports = 0

    var body: some View {

        List {

            Section(
                "Statistics"
            ) {

                HStack {

                    Text(
                        "Total Resumes"
                    )

                    Spacer()

                    Text(
                        "\(totalResumes)"
                    )
                }

                HStack {

                    Text(
                        "Total Exports"
                    )

                    Spacer()

                    Text(
                        "\(totalExports)"
                    )
                }
            }

            Section(
                "Actions"
            ) {

                NavigationLink {

                    AnalyticsView()

                } label: {

                    Label(
                        "Analytics",
                        systemImage:
                            "chart.xyaxis.line"
                    )
                }

                NavigationLink {

                    ResumeEnhancerView()

                } label: {

                    Label(
                        "Resume Enhancer",
                        systemImage:
                            "sparkles"
                    )
                }

                NavigationLink {

                    JobMatchView()

                } label: {

                    Label(
                        "Job Match",
                        systemImage:
                            "briefcase.fill"
                    )
                }

                NavigationLink {

                    InterviewQuestionsView()

                } label: {

                    Label(
                        "Interview Prep",
                        systemImage:
                            "person.crop.rectangle"
                    )
                }

                NavigationLink {

                    CoverLetterView()

                } label: {

                    Label(
                        "Cover Letter",
                        systemImage:
                            "doc.text"
                    )
                }
                NavigationLink {

                    ATSHistoryView()

                } label: {

                    Label(
                        "ATS History",
                        systemImage:
                            "clock"
                    )
                }
                NavigationLink {

                    FavoritesView()

                } label: {

                    Label(
                        "Favorites",
                        systemImage:
                            "star.fill"
                    )
                }
            }
        }
        .navigationTitle(
            "Dashboard"
        )
        .onAppear {

            totalResumes =
                StorageService.shared
                .loadResumes()
                .count

            totalExports =
                ExportHistoryService
                .shared
                .loadExports()
                .count
        }
    }
}

#Preview {

    NavigationStack {

        DashboardView()
    }
}
