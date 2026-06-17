//
//  ExecutiveResumeView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//

import SwiftUI

struct ExecutiveResumeView: View {

    @ObservedObject var viewModel:
        ResumeViewModel

    let skills: String

    var body: some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: 24
            ) {

                Text(
                    viewModel.resume.fullName
                )
                .font(
                    .system(
                        size: 36,
                        weight: .heavy
                    )
                )

                Text(
                    viewModel.resume.email
                )

                Text(
                    viewModel.resume.phone
                )

                Divider()

                Text(
                    "EXECUTIVE PROFILE"
                )
                .font(.title2)
                .fontWeight(.bold)

                Text(
                    viewModel.resume.summary
                    .isEmpty
                    ? "Executive profile not available."
                    : viewModel.resume.summary
                )

                Divider()

                Text(
                    "CAREER HISTORY"
                )
                .font(.title2)
                .fontWeight(.bold)

                ForEach(
                    viewModel.experiences
                ) { experience in

                    VStack(
                        alignment: .leading,
                        spacing: 6
                    ) {

                        Text(
                            experience.company
                        )
                        .font(.headline)

                        Text(
                            experience.role
                        )
                    }
                    .padding(.vertical, 8)
                }

                Divider()

                Text(
                    "CORE SKILLS"
                )
                .font(.title2)
                .fontWeight(.bold)

                Text(skills)
            }
            .padding()
        }
        .navigationTitle(
            "Executive"
        )
    }
}

#Preview {

    NavigationStack {

        ExecutiveResumeView(
            viewModel: ResumeViewModel(),
            skills: "Swift, SwiftUI, UIKit"
        )
    }
}
