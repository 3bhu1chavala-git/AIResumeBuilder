//
//  InterviewQuestionsView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 15/06/26.
//

import SwiftUI

struct InterviewQuestionsView: View {

    @State private var skill = ""

    @State private var questions:
        [String] = []

    var body: some View {

        Form {

            Section(
                "Skill"
            ) {

                TextField(
                    "Enter Skill",
                    text: $skill
                )
            }

            Button(
                "Generate Questions"
            ) {

                questions =
                    InterviewQuestionService
                    .shared
                    .questions(
                        for: skill
                    )
            }

            if !questions.isEmpty {

                Section(
                    "Questions"
                ) {

                    ForEach(
                        questions,
                        id: \.self
                    ) { question in

                        Text(
                            question
                        )
                    }
                }
            }
        }
        .navigationTitle(
            "Interview Prep"
        )
    }
}

#Preview {

    NavigationStack {

        InterviewQuestionsView()
    }
}
