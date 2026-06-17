//
//  ResumeViewModel.swift
//  AIResumeBuilder
//
//  Created by Thribhuvan chavala on 11/06/26.
//
import Foundation
import SwiftUI
import Combine

final class ResumeViewModel:
    ObservableObject {

    @Published var resume =
        Resume()

    @Published var resumes:
        [Resume] = []

    @Published var experiences:
        [Experience] = []

    @Published var selectedTemplate:
        TemplateType = .modern

    init() {

        resumes =
            StorageService.shared
            .loadResumes()
    }

    func saveResume() {

        resume.template =
            selectedTemplate

        resumes.append(
            resume
        )

        StorageService.shared
            .saveResumes(
                resumes
            )
    }

    func updateTemplate(
        _ template:
        TemplateType
    ) {

        selectedTemplate =
            template

        resume.template =
            template
    }

    func updateResume(
        _ updatedResume:
        Resume
    ) {

        guard let index =
            resumes.firstIndex(
                where: {
                    $0.id ==
                    updatedResume.id
                }
            ) else {
            return
        }

        resumes[index] =
            updatedResume

        StorageService.shared
            .saveResumes(
                resumes
            )
    }

    func addExperience() {

        experiences.append(
            Experience()
        )
    }

    func removeExperience(
        at offsets:
        IndexSet
    ) {

        experiences.remove(
            atOffsets:
                offsets
        )
    }
}
