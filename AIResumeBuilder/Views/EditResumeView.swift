//
//  EditResumeView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//

import SwiftUI

struct EditResumeView: View {

    @State var resume: Resume

    var onSave: (Resume) -> Void

    @Environment(\.dismiss)
    private var dismiss

    var body: some View {

        Form {

            Section("Personal Information") {

                TextField(
                    "Full Name",
                    text: $resume.fullName
                )

                TextField(
                    "Email",
                    text: $resume.email
                )

                TextField(
                    "Phone",
                    text: $resume.phone
                )
            }

            Section("Summary") {

                TextField(
                    "Professional Summary",
                    text: $resume.summary,
                    axis: .vertical
                )
                .lineLimit(5...10)
            }

            Button("Save Changes") {

                onSave(resume)

                dismiss()
            }
            .buttonStyle(
                .borderedProminent
            )
        }
        .navigationTitle(
            "Edit Resume"
        )
    }
}

#Preview {

    NavigationStack {

        EditResumeView(
            resume: Resume(
                fullName: "John Doe",
                email: "john@test.com",
                phone: "9999999999",
                summary: "Senior iOS Developer"
            )
        ) { _ in

        }
    }
}
