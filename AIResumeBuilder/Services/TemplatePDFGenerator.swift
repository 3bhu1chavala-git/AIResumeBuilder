//
//  TemplatePDFGenerator.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//
import Foundation
import PDFKit
import UIKit

final class TemplatePDFGenerator {

    static let shared =
        TemplatePDFGenerator()

    private init() { }

    func createPDF(
        resume: Resume,
        skills: String
    ) -> URL? {

        let fileName =
            "\(resume.fullName).pdf"

        let url =
            FileManager.default
            .temporaryDirectory
            .appendingPathComponent(
                fileName
            )

        let renderer =
            UIGraphicsPDFRenderer(
                bounds: CGRect(
                    x: 0,
                    y: 0,
                    width: 595,
                    height: 842
                )
            )

        do {

            try renderer.writePDF(
                to: url
            ) { context in

                context.beginPage()

                switch resume.template {

                case .modern:

                    drawResume(
                        title:
                            resume.fullName,
                        resume:
                            resume,
                        skills:
                            skills
                    )

                case .professional:

                    drawResume(
                        title:
                            "Professional Resume",
                        resume:
                            resume,
                        skills:
                            skills
                    )

                case .executive:

                    drawResume(
                        title:
                            "Executive Resume",
                        resume:
                            resume,
                        skills:
                            skills
                    )
                }
            }

            return url

        } catch {

            print(error)

            return nil
        }
    }

    private func drawResume(
        title: String,
        resume: Resume,
        skills: String
    ) {

        let titleAttributes:
            [NSAttributedString.Key: Any] = [

                .font:
                    UIFont.boldSystemFont(
                        ofSize: 28
                    )
            ]

        let headerAttributes:
            [NSAttributedString.Key: Any] = [

                .font:
                    UIFont.boldSystemFont(
                        ofSize: 20
                    )
            ]

        let bodyAttributes:
            [NSAttributedString.Key: Any] = [

                .font:
                    UIFont.systemFont(
                        ofSize: 16
                    )
            ]

        title.draw(
            at: CGPoint(
                x: 40,
                y: 40
            ),
            withAttributes:
                titleAttributes
        )

        resume.email.draw(
            at: CGPoint(
                x: 40,
                y: 90
            ),
            withAttributes:
                bodyAttributes
        )

        resume.phone.draw(
            at: CGPoint(
                x: 40,
                y: 120
            ),
            withAttributes:
                bodyAttributes
        )

        "Summary".draw(
            at: CGPoint(
                x: 40,
                y: 170
            ),
            withAttributes:
                headerAttributes
        )

        resume.summary.draw(
            in: CGRect(
                x: 40,
                y: 200,
                width: 500,
                height: 120
            ),
            withAttributes:
                bodyAttributes
        )

        "Skills".draw(
            at: CGPoint(
                x: 40,
                y: 340
            ),
            withAttributes:
                headerAttributes
        )

        skills.draw(
            in: CGRect(
                x: 40,
                y: 370,
                width: 500,
                height: 120
            ),
            withAttributes:
                bodyAttributes
        )
    }
}
