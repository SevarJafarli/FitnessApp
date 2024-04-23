//
//  JSONLoader.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 17.04.24.
//

import Foundation

class JSONLoader {
    static let shared = JSONLoader()
    
    func loadJSONData<T: Decodable>(fromFileNamed fileName: String, ofType fileType: String, as type: T.Type) -> T? {
        if let path = Bundle.main.path(forResource: fileName, ofType: fileType) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let jsonData = try JSONDecoder().decode(type, from: data)
                return jsonData
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("File not found: \(fileName).\(fileType)")
        }
        return nil
    }

}
