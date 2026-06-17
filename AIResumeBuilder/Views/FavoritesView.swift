//
//  FavoritesView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 15/06/26.
//

import SwiftUI

struct FavoritesView: View {

    @State private var resumes:
        [Resume] = []

    var body: some View {

        List {

            ForEach(
                resumes
            ) { resume in

                Text(
                    resume.fullName
                )
            }
        }
        .navigationTitle(
            "Favorites"
        )
        .onAppear {

            let favorites =
                FavoritesService
                .shared
                .load()

            resumes =
                StorageService
                .shared
                .loadResumes()
                .filter {

                    favorites.contains(
                        $0.id.uuidString
                    )
                }
        }
    }
}

#Preview {

    NavigationStack {

        FavoritesView()
    }
}
