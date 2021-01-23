//
//  User+CoreDataProperties.swift
//  Chat App
//
//  Created by Nitin Patil on 16/01/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var chatInfo: String?

}

extension User : Identifiable {

}
