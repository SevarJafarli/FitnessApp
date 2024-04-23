//
//  HomeDataResponse.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 16.04.24.
//

import UIKit

// MARK: - Nearby
struct GymModel: Decodable {
    let id: Int
    let gymName: String
    let rating: Double
    let gymImage: String
    let about: String
    let openDays: String
    let openHours: String
    let includingServiceIds: [Int]
    let contactInfo: [String]
    let socialMediaAccs: [GymSocialMediaModel]
    let isNearby: Bool
    let isNewPartner: Bool
}

//MARK: - GymContactInfoModel

struct GymContactInfoModel: Decodable {
    let phoneNumber: String
    let location: String
}


enum GymSocialMediaModel: String, Decodable {
    case instagram
    case facebook
    case whatsapp
    case twitter
    
    var icon: UIImage? {
        switch self {
        case .instagram:
                .instagram
        case .facebook:
                .facebook
        case .whatsapp:
                .whatsapp
        case .twitter:
                .twitter
        }
    }
}
