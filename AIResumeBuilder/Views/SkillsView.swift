//
//  SkillsView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//

import SwiftUI

struct SkillsView: View {

    @ObservedObject var viewModel:
        ResumeViewModel

    @State private var skills = ""

    var body: some View {

        Form {

            TextField(
                "Skills",
                text: $skills
            )

            NavigationLink {

                ResumePreviewView(
                    viewModel: viewModel,
                    skills: skills
                )

            } label: {

                Text("Generate Resume")
            }
        }
        .navigationTitle("Skills")
    }
}
