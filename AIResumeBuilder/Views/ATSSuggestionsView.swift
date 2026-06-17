//
//  ATSSuggestionsView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 15/06/26.
//

import SwiftUI

struct ATSSuggestionsView: View {

    let score: Int

    var body: some View {

        List {

            ForEach(
                ATSRecommendationService
                    .shared
                    .suggestions(
                        score: score
                    ),
                id: \.self
            ) { item in

                Label(
                    item,
                    systemImage:
                        "checkmark.circle"
                )
            }
        }
        .navigationTitle(
            "ATS Suggestions"
        )
    }
}

#Preview {

    NavigationStack {

        ATSSuggestionsView(
            score: 70
        )
    }
}
