//
//  TemplateSelectionView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//

import SwiftUI

struct TemplateSelectionView: View {

    @ObservedObject var viewModel:
        ResumeViewModel

    var body: some View {

        List {

            ForEach(
                TemplateType.allCases
            ) { template in

                Button {

                    viewModel
                        .updateTemplate(
                            template
                        )

                } label: {

                    HStack {

                        Text(
                            template
                                .displayName
                        )

                        Spacer()

                        if viewModel
                            .selectedTemplate
                            == template {

                            Image(
                                systemName:
                                "checkmark.circle.fill"
                            )
                            .foregroundColor(
                                .green
                            )
                        }
                    }
                }
            }
        }
        .navigationTitle(
            "Templates"
        )
    }
}

#Preview {

    NavigationStack {

        TemplateSelectionView(
            viewModel:
                ResumeViewModel()
        )
    }
}
