//
//  ATSHistoryView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 15/06/26.
//

import SwiftUI

struct ATSHistoryView: View {

    @State private var reports:
        [Int] = []

    var body: some View {

        List {

            ForEach(
                reports.indices,
                id: \.self
            ) { index in

                HStack {

                    Text(
                        "Report \(index + 1)"
                    )

                    Spacer()

                    Text(
                        "\(reports[index])"
                    )
                }
            }
        }
        .navigationTitle(
            "ATS History"
        )
        .onAppear {

            reports =
                ATSReportService
                .shared
                .load()
        }
    }
}

#Preview {

    NavigationStack {

        ATSHistoryView()
    }
}
