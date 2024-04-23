//
//  AuthManager.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 23.04.24.
//


import UIKit
import CoreData

class AuthManager {
    
    var context: NSManagedObjectContext?
    
    //    private var user: User? = nil
    
    init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        context = appDelegate.persistentContainer.viewContext
    }
    
    func save() {
        guard let context = context else { return }
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    
    func register(data: UserItemModel) {
        guard let context = context else { return }
        let user = UserModel(context: context)
        user.setValue(data.id, forKey: "id")
        user.setValue(data.name, forKeyPath: "name")
        user.setValue(data.username, forKey: "username")
        user.setValue(data.surname, forKeyPath: "surname")
        user.setValue(data.password, forKeyPath: "password")
        save()
        print("new user created")
    }
    
    
    func login(username: String, password: String) -> UserModel? {
        guard let context = context else { return nil }
        
        let request: NSFetchRequest<UserModel> = UserModel.fetchRequest()
        request.predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)
        
        
        do {
            let users = try context.fetch(request)
            if let user = users.first {
                return user
            } else {
                print("No user found for username: \(username) and password: \(password)")
                return nil
            }
        } catch {
            print("Failed to fetch user: \(error)")
            return nil
        }
    }
}

