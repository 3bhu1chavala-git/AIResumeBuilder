//
//  HomeView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//
import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel =
        ResumeViewModel()

    @State private var searchText = ""

    var filteredResumes:
        [Resume] {

        ResumeSearch.filter(
            resumes:
                viewModel.resumes,
            searchText:
                searchText
        )
    }

    var body: some View {

        NavigationStack {

            VStack {

                NavigationLink {

                    ResumeFormView()

                } label: {

                    Text(
                        "Create Resume"
                    )
                    .frame(
                        maxWidth: .infinity
                    )
                    .padding()
                    .background(
                        Color.blue
                    )
                    .foregroundColor(
                        .white
                    )
                    .cornerRadius(12)
                }
                .padding()

                TextField(
                    "Search Resume",
                    text: $searchText
                )
                .textFieldStyle(
                    .roundedBorder
                )
                .padding(
                    .horizontal
                )

                if filteredResumes.isEmpty {

                    ContentUnavailableView(
                        "No Resumes",
                        systemImage:
                            "doc.text",
                        description:
                            Text(
                                "Create your first resume."
                            )
                    )

                } else {

                    List {

                        ForEach(
                            filteredResumes
                        ) { resume in

                            NavigationLink {

                                ResumeDetailView(
                                    resume: resume
                                )

                            } label: {

                                VStack(
                                    alignment: .leading
                                ) {

                                    Text(
                                        resume.fullName
                                    )
                                    .font(
                                        .headline
                                    )

                                    Text(
                                        resume.email
                                    )
                                    .font(
                                        .caption
                                    )
                                }
                            }
                        }
                        .onDelete(
                            perform:
                                deleteResume
                        )
                    }
                }
            }
            .navigationTitle(
                "AI Resume Builder"
            )
            .toolbar {

                ToolbarItem(
                    placement:
                        .topBarLeading
                ) {

                    NavigationLink {

                        DashboardView()

                    } label: {

                        Image(
                            systemName:
                                "chart.bar"
                        )
                    }
                }

                ToolbarItem(
                    placement:
                        .topBarTrailing
                ) {

                    NavigationLink {

                        SettingsView()

                    } label: {

                        Image(
                            systemName:
                                "gearshape"
                        )
                    }
                }
            }
            .onAppear {

                viewModel.resumes =
                    StorageService
                    .shared
                    .loadResumes()
            }
        }
    }

    private func deleteResume(
        at offsets: IndexSet
    ) {

        viewModel.resumes
            .remove(
                atOffsets:
                    offsets
            )

        StorageService
            .shared
            .saveResumes(
                viewModel.resumes
            )
    }
}

#Preview {

    HomeView()
}
