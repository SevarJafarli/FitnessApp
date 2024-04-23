//
//  GymServicesResponse.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 17.04.24.
//

import Foundation


//MARK: GymServicesResponse
struct GymServicesResponse: Decodable {
    let services: [GymServiceModel]
}

// MARK: - GymServiceModel
struct GymServiceModel: Decodable {
    let id: Int
    let serviceName, serviceImage, imageColor, bgColor: String
}
