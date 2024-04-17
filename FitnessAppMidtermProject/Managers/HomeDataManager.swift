//
//  HomeDataManager.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 16.04.24.
//

import Foundation

final class HomeDataManager {
    static let shared = HomeDataManager()
    
    func loadData() -> HomeDataResponse? {
        var response: HomeDataResponse? = nil
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let jsonResult = try JSONDecoder().decode(HomeDataResponse.self, from: data)
                response = jsonResult
            }
               catch {
                   print(error)
              }
        }
        return response
    }
}
