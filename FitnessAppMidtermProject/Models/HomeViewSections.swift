//
//  HomeViewSections.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 11.04.24.
//

import Foundation

enum HomeViewSections: CaseIterable {
    case categories
    case newPartners
    case nearby
    

    var sectionTitle: String? {
        switch self {
        case .categories:
            nil
        case .newPartners:
            "New Partners"
        case .nearby:
            "Nearby"
        }
    }
}
