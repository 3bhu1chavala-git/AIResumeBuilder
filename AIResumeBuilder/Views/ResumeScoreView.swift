//
//  ResumeScoreView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 15/06/26.
//

import SwiftUI

struct ResumeScoreView: View {

    let atsScore: Int

    var body: some View {

        VStack(
            spacing: 30
        ) {

            Text(
                "Resume Score"
            )
            .font(
                .largeTitle
            )

            ZStack {

                Circle()
                    .stroke(
                        Color.gray.opacity(
                            0.2
                        ),
                        lineWidth: 20
                    )

                Circle()
                    .trim(
                        from: 0,
                        to:
                            Double(
                                atsScore
                            ) / 100
                    )
                    .stroke(
                        Color.green,
                        style:
                            StrokeStyle(
                                lineWidth: 20,
                                lineCap:
                                    .round
                            )
                    )
                    .rotationEffect(
                        .degrees(-90)
                    )

                Text(
                    "\(atsScore)"
                )
                .font(
                    .largeTitle
                )
                .fontWeight(
                    .bold
                )
            }
            .frame(
                width: 220,
                height: 220
            )

            Text(
                feedbackText
            )
            .multilineTextAlignment(
                .center
            )
            .padding()

            NavigationLink {

                ATSSuggestionsView(
                    score: atsScore
                )

            } label: {

                Text(
                    "View ATS Suggestions"
                )
            }
            .buttonStyle(
                .borderedProminent
            )

            Spacer()
        }
        .padding()
        .navigationTitle(
            "Resume Score"
        )
    }

    private var feedbackText:
        String {

        switch atsScore {

        case 90...100:
            return
            "Excellent ATS score."

        case 75..<90:
            return
            "Strong resume with minor improvements."

        case 60..<75:
            return
            "Add more relevant keywords."

        default:
            return
            "Resume needs significant optimization."
        }
    }
}

#Preview {

    NavigationStack {

        ResumeScoreView(
            atsScore: 87
        )
    }
}
