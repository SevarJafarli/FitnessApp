//
//  UserModel+CoreDataProperties.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 23.04.24.
//
//

import Foundation
import CoreData


extension UserModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserModel> {
        return NSFetchRequest<UserModel>(entityName: "UserModel")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var surname: String?
    @NSManaged public var username: String?
    @NSManaged public var password: String?

}

extension UserModel : Identifiable {

}
