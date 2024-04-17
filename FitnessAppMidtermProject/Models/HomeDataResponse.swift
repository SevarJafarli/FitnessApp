//
//  HomeDataResponse.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 16.04.24.
//

import Foundation


// MARK: - HomeDataResponse
struct HomeDataResponse: Decodable {
    let services: [GymServiceModel]
    let nearby, newPartners: [GymModel]
}

// MARK: - Nearby
struct GymModel: Decodable {
    let id: Int
    let gymName: String
    let rating: Double
    let gymImage: String
    let about: String?
    let openDays: String?
    let openHours: String?
    let includingServiceIds: [Int]?
    let contactInfo: [String]?
    let socialMediaAccs: [String]?
}

// MARK: - Service
struct GymServiceModel: Decodable {
    let id: Int
    let serviceName, serviceImage, imageColor, bgColor: String
}



//MARK: - GymContactInfoModel

struct GymContactInfoModel: Decodable {
    let phoneNumber: String
    let location: String
}
