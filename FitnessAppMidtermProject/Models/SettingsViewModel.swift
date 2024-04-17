//
//  SettingsViewModel.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 11.04.24.
//

import UIKit


enum SettingsModel: CaseIterable {
    case helpAndSupport
    case aboutUs
    case privacyPolicy
    case termsAndConditions
    
    var title: String {
        switch self {
        case .helpAndSupport:
            "Help and Support"
        case .aboutUs:
            "About us"
        case .privacyPolicy:
            "Privacy Policy"
        case .termsAndConditions:
            "Terms and Conditions"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .helpAndSupport:
                .help
        case .aboutUs:
                .about
        case .privacyPolicy:
                .privacy
        case .termsAndConditions:
                .terms
        }
    }
    
    var description: String? {
        switch self {
        case .helpAndSupport:
            "Diam ultricies amet eu scelerisque mattis turpis pellentesque augue. Turpis condimentum augue ullamcorper aenean. Lobortis interdum neque placerat vitae. Vel tempus pretium ut bibendum erat lacus lorem consequat sit. Tellus faucibus nisl vitae pellentesque turpis porta."
        case .aboutUs:
            "Diam ultricies amet eu scelerisque mattis turpis pellentesque augue. Turpis condimentum augue ullamcorper aenean. Lobortis interdum neque placerat vitae. Vel tempus pretium ut bibendum erat lacus lorem consequat sit. Tellus faucibus nisl vitae pellentesque turpis porta."
        case .privacyPolicy:
            "Diam ultricies amet eu scelerisque mattis turpis pellentesque augue. Turpis condimentum augue ullamcorper aenean. Lobortis interdum neque placerat vitae. Vel tempus pretium ut bibendum erat lacus lorem consequat sit. Tellus faucibus nisl vitae pellentesque turpis porta."
        case .termsAndConditions:
            "Diam ultricies amet eu scelerisque mattis turpis pellentesque augue. Turpis condimentum augue ullamcorper aenean. Lobortis interdum neque placerat vitae. Vel tempus pretium ut bibendum erat lacus lorem consequat sit. Tellus faucibus nisl vitae pellentesque turpis porta."
        }
    }
}
