//
//  ResumeEnhancerView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//
import SwiftUI

struct ResumeEnhancerView: View {

    @State private var summary = ""
    @State private var improvedSummary = ""

    var body: some View {

        Form {

            Section("Current Summary") {

                TextEditor(
                    text: $summary
                )
                .frame(
                    height: 150
                )
            }

            Button(
                "Improve Summary"
            ) {

                OpenAIResumeEnhancer
                    .shared
                    .improveSummary(
                        currentSummary: summary
                    ) { result in

                        improvedSummary =
                            result
                    }
            }

            if !improvedSummary.isEmpty {

                Section("AI Enhanced") {

                    Text(
                        improvedSummary
                    )
                }
            }
        }
        .navigationTitle(
            "Resume Enhancer"
        )
    }
}

#Preview {

    NavigationStack {

        ResumeEnhancerView()
    }
}
