//
//  ModernResumeView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//

import SwiftUI

struct ModernResumeView: View {

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
                    alignment: .center,
                    spacing: 8
                ) {

                    Text(
                        viewModel.resume.fullName
                    )
                    .font(.largeTitle)
                    .fontWeight(.bold)

                    Text(
                        viewModel.resume.email
                    )

                    Text(
                        viewModel.resume.phone
                    )
                }
                .frame(
                    maxWidth: .infinity
                )

                Divider()

                Text(
                    "Professional Summary"
                )
                .font(.title2)
                .fontWeight(.semibold)

                Text(
                    viewModel.resume.summary
                    .isEmpty
                    ? "No summary generated."
                    : viewModel.resume.summary
                )

                Divider()

                Text(
                    "Experience"
                )
                .font(.title2)
                .fontWeight(.semibold)

                ForEach(
                    viewModel.experiences
                ) { experience in

                    VStack(
                        alignment: .leading,
                        spacing: 4
                    ) {

                        Text(
                            experience.company
                        )
                        .font(.headline)

                        Text(
                            experience.role
                        )
                    }
                    .padding()
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .background(
                        Color.gray.opacity(0.1)
                    )
                    .cornerRadius(12)
                }

                Divider()

                Text(
                    "Skills"
                )
                .font(.title2)
                .fontWeight(.semibold)

                Text(skills)
            }
            .padding()
        }
        .navigationTitle(
            "Modern Template"
        )
    }
}

#Preview {

    NavigationStack {

        ModernResumeView(
            viewModel: ResumeViewModel(),
            skills: "Swift, SwiftUI, UIKit"
        )
    }
}
