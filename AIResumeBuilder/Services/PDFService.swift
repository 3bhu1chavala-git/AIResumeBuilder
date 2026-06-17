//
//  PDFService.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//

import Foundation
import PDFKit
import UIKit

final class PDFService {

    static let shared = PDFService()

    func createPDF(
        name: String,
        email: String,
        phone: String,
        skills: String
    ) -> URL? {

        let metaData = [
            kCGPDFContextCreator:
                "AI Resume Builder",
            kCGPDFContextAuthor:
                name
        ]

        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo =
            metaData as [String : Any]

        let pageWidth: CGFloat = 612
        let pageHeight: CGFloat = 792

        let bounds = CGRect(
            x: 0,
            y: 0,
            width: pageWidth,
            height: pageHeight
        )

        let renderer =
            UIGraphicsPDFRenderer(
                bounds: bounds,
                format: format
            )

        let url =
            FileManager.default
            .temporaryDirectory
            .appendingPathComponent(
                "Resume.pdf"
            )

        do {

            try renderer.writePDF(
                to: url
            ) { context in

                context.beginPage()

                let title =
                    "\(name)\n\n\(email)\n\(phone)\n\nSkills:\n\(skills)"

                let attributes:
                [NSAttributedString.Key: Any] = [

                    .font:
                        UIFont.systemFont(
                            ofSize: 20
                        )
                ]

                title.draw(
                    in: CGRect(
                        x: 30,
                        y: 30,
                        width: 500,
                        height: 700
                    ),
                    withAttributes:
                        attributes
                )
            }

            return url

        } catch {

            print(error)
            return nil
        }
    }
}
