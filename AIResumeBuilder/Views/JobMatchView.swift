//
//  JobMatchView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 15/06/26.
//

import SwiftUI

struct JobMatchView: View {

    @State private var resumeSkills = ""
    @State private var jobDescription = ""

    @State private var matchScore = 0

    var body: some View {

        Form {

            Section(
                "Resume Skills"
            ) {

                TextEditor(
                    text: $resumeSkills
                )
                .frame(
                    height: 120
                )
            }

            Section(
                "Job Description"
            ) {

                TextEditor(
                    text: $jobDescription
                )
                .frame(
                    height: 200
                )
            }

            Button(
                "Calculate Match"
            ) {

                matchScore =
                    JobMatchService
                    .shared
                    .calculateMatch(
                        resumeSkills:
                            resumeSkills,
                        jobDescription:
                            jobDescription
                    )
            }

            if matchScore > 0 {

                Section(
                    "Result"
                ) {

                    Text(
                        "\(matchScore)% Match"
                    )
                    .font(
                        .largeTitle
                    )
                    .fontWeight(
                        .bold
                    )
                }
            }
        }
        .navigationTitle(
            "Job Match"
        )
    }
}

#Preview {

    NavigationStack {

        JobMatchView()
    }
}
