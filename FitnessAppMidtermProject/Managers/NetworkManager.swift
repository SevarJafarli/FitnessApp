//
//  HomeDataManager.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 16.04.24.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchServices() -> [GymServiceModel] {
        var services = [GymServiceModel]()
        
        if let data = JSONLoader.shared.loadJSONData(fromFileNamed: "services", ofType: "json", as: GymServicesResponse.self) {
            services = data.services
        }
        return services
    }
    
    func fetchServicesByIds(ids: [Int]) -> [GymServiceModel] {
        var services = [GymServiceModel]()
        
        if let data = JSONLoader.shared.loadJSONData(fromFileNamed: "services", ofType: "json", as: GymServicesResponse.self) {
            
            services = data.services.filter { ids.contains( $0.id)}
        }
        
        return services
    }
    
    func fetchAllGyms() -> [GymModel] {
        var response =  [GymModel]()
        
        if let data = JSONLoader.shared.loadJSONData(fromFileNamed: "allGyms", ofType: "json", as: AllGymsResponse.self) {
            response = data.allGyms
            
        }
        
        return response
    }
    
    func fetchGymsWithService(serviceId: Int) -> [GymModel] {
        var response = fetchAllGyms()
        response = response.filter { $0.includingServiceIds.contains(serviceId)}
        
        return response
    }
    
    func searchGym(with query: String) -> [GymModel]  {
        var response = fetchAllGyms()
        
            response = response.filter { $0.gymName.lowercased().starts(with: query.lowercased()) }
        
        
        return response
    }
    
    func fetchNearbyGyms() -> [GymModel]  {
        var response = fetchAllGyms()
        
        response = response.filter { $0.isNearby }
        
        return response
    }
    
    func fetchNewPartnerGyms() -> [GymModel]  {
        var response = fetchAllGyms()
        
        response = response.filter { $0.isNewPartner }
        
        return response
    }
}
