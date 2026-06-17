//
//  ExperienceView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//

import SwiftUI

struct ExperienceView: View {

    @ObservedObject var viewModel:
        ResumeViewModel

    @State private var company = ""
    @State private var role = ""

    var body: some View {

        Form {

            TextField(
                "Company",
                text: $company
            )

            TextField(
                "Role",
                text: $role
            )

            Button("Add Experience") {

                let experience =
                    Experience(
                        company: company,
                        role: role
                    )

                viewModel.experiences
                    .append(experience)

                company = ""
                role = ""
            }

            ForEach(
                viewModel.experiences
            ) { experience in

                VStack(
                    alignment: .leading
                ) {

                    Text(experience.company)
                        .font(.headline)

                    Text(experience.role)
                }
            }

            NavigationLink {

                SkillsView(
                    viewModel: viewModel
                )

            } label: {

                Text("Next")
            }
        }
        .navigationTitle("Experience")
    }
}
