//
//  TemplateType.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 13/06/26.
//
import Foundation

enum TemplateType:
    String,
    CaseIterable,
    Codable,
    Identifiable {

    case modern
    case professional
    case executive

    var id: String {
        rawValue
    }

    var displayName: String {

        switch self {

        case .modern:
            return "Modern"

        case .professional:
            return "Professional"

        case .executive:
            return "Executive"
        }
    }
}
