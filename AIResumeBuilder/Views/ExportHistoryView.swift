//
//  ExportHistoryView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//

import SwiftUI

struct ExportHistoryView: View {

    @State private var exports:
        [String] = []

    var body: some View {

        List {

            ForEach(
                exports,
                id: \.self
            ) { export in

                Text(export)
            }
        }
        .navigationTitle(
            "Export History"
        )
        .onAppear {

            exports =
                ExportHistoryService
                .shared
                .loadExports()
        }
    }
}

#Preview {

    NavigationStack {

        ExportHistoryView()
    }
}
