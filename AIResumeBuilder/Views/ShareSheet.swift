//
//  ShareSheet.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//

import SwiftUI
import UIKit

struct ShareSheet:
    UIViewControllerRepresentable {

    let items: [Any]

    func makeUIViewController(
        context: Context
    ) -> UIActivityViewController {

        UIActivityViewController(
            activityItems: items,
            applicationActivities: nil
        )
    }

    func updateUIViewController(
        _ uiViewController:
        UIActivityViewController,
        context: Context
    ) {

    }
}
