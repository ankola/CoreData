//
//  User+CoreDataProperties.swift
//  CoreData2
//
//  Created by agile on 5/28/18.
//  Copyright © 2018 agile. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var number: String?
    @NSManaged public var lastname: String?

}
