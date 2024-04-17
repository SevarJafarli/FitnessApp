//
//  GymDetailViewSections.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 16.04.24.
//

import Foundation


enum GymDetailViewSections: CaseIterable {
    case aboutInfo
    case includedServices
    case contactInfo
    

    var sectionTitle: String {
        switch self {
        case .aboutInfo:
            "About"
        case .includedServices:
            "Services"
        case .contactInfo:
            "Contact"
        }
    }
}
