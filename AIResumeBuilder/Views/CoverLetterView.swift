//
//  CoverLetterView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 15/06/26.
//
import SwiftUI

struct CoverLetterView: View {

    @State private var name = ""
    @State private var position = ""
    @State private var company = ""

    @State private var coverLetter = ""

    var body: some View {

        Form {

            Section(
                "Details"
            ) {

                TextField(
                    "Your Name",
                    text: $name
                )

                TextField(
                    "Position",
                    text: $position
                )

                TextField(
                    "Company",
                    text: $company
                )
            }

            Button(
                "Generate Cover Letter"
            ) {

                coverLetter =
                    CoverLetterService
                    .shared
                    .generate(
                        name: name,
                        position: position,
                        company: company
                    )
            }

            if !coverLetter.isEmpty {

                Section(
                    "Cover Letter"
                ) {

                    Text(
                        coverLetter
                    )
                }
            }
        }
        .navigationTitle(
            "Cover Letter"
        )
    }
}

#Preview {

    NavigationStack {

        CoverLetterView()
    }
}
