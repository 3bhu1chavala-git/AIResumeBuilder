//
//  PDFPreviewView.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//

import SwiftUI
import PDFKit

struct PDFPreviewView:
    UIViewRepresentable {

    let url: URL

    func makeUIView(
        context: Context
    ) -> PDFView {

        let pdfView = PDFView()

        pdfView.autoScales = true

        pdfView.document =
            PDFDocument(
                url: url
            )

        return pdfView
    }

    func updateUIView(
        _ uiView: PDFView,
        context: Context
    ) {

    }
}
