//
//  ResumePreviewView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//
import SwiftUI
import UIKit

struct ResumePreviewView: View {

    @ObservedObject var viewModel: ResumeViewModel

    let skills: String

    @State private var pdfURL: URL?
    @State private var summary = ""

    @State private var atsScore = 0
    @State private var showScore = false

    @State private var showShareSheet = false
    @State private var showPDFPreview = false

    @State private var isLoading = false

    private let aiService =
        OpenAIService()

    var body: some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: 16
            ) {

                Text(
                    viewModel.resume.fullName
                )
                .font(.largeTitle)

                Text(
                    viewModel.resume.email
                )

                Text(
                    viewModel.resume.phone
                )

                Divider()

                Text("Professional Summary")
                    .font(.title2)

                if isLoading {

                    ProgressView(
                        "Generating..."
                    )
                }

                if summary.isEmpty {

                    Text(
                        "Tap Generate AI Summary"
                    )
                    .foregroundColor(.gray)

                } else {

                    Text(summary)
                }

                Button(
                    "Generate AI Summary"
                ) {

                    isLoading = true

                    aiService.generateSummary(
                        name:
                            viewModel.resume.fullName,
                        skills:
                            skills
                    ) { response in

                        summary = response
                        isLoading = false
                    }
                }
                .buttonStyle(
                    .borderedProminent
                )

                Divider()

                Text("ATS Score")
                    .font(.title2)

                Button(
                    "Calculate ATS Score"
                ) {

                    atsScore =
                        ATSService.shared
                        .calculateScore(
                            skills: skills,
                            experiences:
                                viewModel.experiences.count
                        )

                    ATSReportService
                        .shared
                        .save(
                            score: atsScore
                        )

                    showScore = true
                }
                .buttonStyle(
                    .borderedProminent
                )

                if showScore {

                    NavigationLink {

                        ResumeScoreView(
                            atsScore:
                                atsScore
                        )

                    } label: {

                        Text(
                            "\(atsScore)/100"
                        )
                        .font(
                            .largeTitle
                        )
                        .fontWeight(
                            .bold
                        )
                    }
                }

                Divider()

                Text("Experience")
                    .font(.title2)

                ForEach(
                    viewModel.experiences
                ) { experience in

                    VStack(
                        alignment: .leading
                    ) {

                        Text(
                            experience.company
                        )
                        .bold()

                        Text(
                            experience.role
                        )
                    }
                }

                Divider()

                Text("Skills")
                    .font(.title2)

                Text(skills)

                Divider()

                Text("Selected Template")
                    .font(.title2)

                Text(
                    viewModel
                        .selectedTemplate
                        .displayName
                )

                Divider()

                NavigationLink {

                    TemplateSelectionView(
                        viewModel: viewModel
                    )

                } label: {

                    Text(
                        "Choose Template"
                    )
                }
                .buttonStyle(
                    .borderedProminent
                )

                Button("Save Resume") {

                    viewModel.saveResume()
                }
                .buttonStyle(
                    .borderedProminent
                )

                Button("Export PDF") {

                    let url =
                        TemplatePDFGenerator
                        .shared
                        .createPDF(
                            resume:
                                viewModel.resume,
                            skills:
                                skills
                        )

                    pdfURL = url

                    if let url {

                        ExportHistoryService
                            .shared
                            .saveExport(
                                fileName:
                                    url.lastPathComponent
                            )
                    }
                }
                .buttonStyle(
                    .bordered
                )

                Button("Preview PDF") {

                    if pdfURL != nil {

                        showPDFPreview = true
                    }
                }
                .buttonStyle(
                    .bordered
                )

                Button("Share Resume") {

                    if pdfURL != nil {

                        ResumeAnalyticsService
                            .shared
                            .increaseShareCount()

                        showShareSheet = true
                    }
                }
                .buttonStyle(
                    .borderedProminent
                )

                if let pdfURL {

                    Text("PDF Created")
                        .foregroundColor(
                            .green
                        )

                    Text(
                        pdfURL.lastPathComponent
                    )
                    .font(.caption)
                }
            }
            .padding()
        }
        .sheet(
            isPresented:
                $showShareSheet
        ) {

            if let pdfURL {

                ShareSheet(
                    items: [pdfURL]
                )
            }
        }
        .sheet(
            isPresented:
                $showPDFPreview
        ) {

            if let pdfURL {

                PDFPreviewView(
                    url: pdfURL
                )
            }
        }
        .navigationTitle(
            "Resume Preview"
        )
    }
}

#Preview {

    NavigationStack {

        ResumePreviewView(
            viewModel: ResumeViewModel(),
            skills: "Swift, SwiftUI, UIKit"
        )
    }
}
