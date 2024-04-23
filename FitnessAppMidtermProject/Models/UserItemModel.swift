//
//  UserViewModel.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 23.04.24.
//

import Foundation

struct UserItemModel {
    var id: UUID
    var name: String
    var surname: String
    var username: String
    var password: String
    
    init(id: UUID, name: String, surname: String, username: String, password: String) {
        self.id = id
        self.name = name
        self.surname = surname
        self.username = username
        self.password = password
    }
}
