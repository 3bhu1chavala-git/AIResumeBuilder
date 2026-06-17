//
//  ResumeFormView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//
import SwiftUI

struct ResumeFormView: View {

    @StateObject private var viewModel =
        ResumeViewModel()

    var body: some View {

        Form {

            Section("Personal Information") {

                TextField(
                    "Full Name",
                    text: $viewModel.resume.fullName
                )

                TextField(
                    "Email",
                    text: $viewModel.resume.email
                )

                TextField(
                    "Phone",
                    text: $viewModel.resume.phone
                )
            }

            NavigationLink {

                ExperienceView(
                    viewModel: viewModel
                )

            } label: {

                Text("Next")
            }
        }
        .navigationTitle("Resume")
    }
}

#Preview {

    NavigationStack {

        ResumeFormView()
    }
}
