//
//  ProfessionalResumeView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//

import SwiftUI

struct ProfessionalResumeView: View {

    @ObservedObject var viewModel:
        ResumeViewModel

    let skills: String

    var body: some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: 20
            ) {

                VStack(
                    alignment: .leading,
                    spacing: 8
                ) {

                    Text(
                        viewModel.resume.fullName
                    )
                    .font(.system(
                        size: 32,
                        weight: .bold
                    ))

                    Text(
                        viewModel.resume.email
                    )

                    Text(
                        viewModel.resume.phone
                    )
                }

                Divider()

                Text("SUMMARY")
                    .font(.headline)

                Text(
                    viewModel.resume.summary
                    .isEmpty
                    ? "Professional summary not available."
                    : viewModel.resume.summary
                )

                Divider()

                Text("EXPERIENCE")
                    .font(.headline)

                ForEach(
                    viewModel.experiences
                ) { experience in

                    VStack(
                        alignment: .leading,
                        spacing: 6
                    ) {

                        Text(
                            experience.role
                        )
                        .font(.headline)

                        Text(
                            experience.company
                        )
                        .font(.subheadline)
                    }
                    .padding(.vertical, 6)
                }

                Divider()

                Text("SKILLS")
                    .font(.headline)

                Text(skills)
            }
            .padding()
        }
        .navigationTitle(
            "Professional"
        )
    }
}

#Preview {

    NavigationStack {

        ProfessionalResumeView(
            viewModel: ResumeViewModel(),
            skills: "Swift, SwiftUI, UIKit"
        )
    }
}
