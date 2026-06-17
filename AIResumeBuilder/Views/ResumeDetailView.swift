//
//  ResumeDetailView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//

import SwiftUI

struct ResumeDetailView: View {

    let resume: Resume

    @StateObject private var viewModel =
        ResumeViewModel()

    var body: some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: 16
            ) {

                Text(
                    resume.fullName
                )
                .font(.largeTitle)

                Text(
                    resume.email
                )

                Text(
                    resume.phone
                )

                Divider()

                Text(
                    "Professional Summary"
                )
                .font(.title2)

                Text(
                    resume.summary
                )

                Divider()

                NavigationLink {

                    EditResumeView(
                        resume: resume
                    ) { updatedResume in

                        viewModel.updateResume(
                            updatedResume
                        )
                    }

                } label: {

                    Text(
                        "Edit Resume"
                    )
                }
                .buttonStyle(
                    .borderedProminent
                )
            }
            .padding()
        }
        .navigationTitle(
            "Resume Details"
        )
    }
}

#Preview {

    NavigationStack {

        ResumeDetailView(
            resume: Resume(
                fullName: "John Doe",
                email: "john@test.com",
                phone: "9999999999",
                summary: "Senior iOS Developer"
            )
        )
    }
}
