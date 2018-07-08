//
//  Students+CoreDataProperties.swift
//  Cdata
//
//  Created by Jay Vasdewani on 28/06/18.
//  Copyright © 2018 Jay Vasdewani. All rights reserved.
//
//

import Foundation
import CoreData


extension Students {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Students> {
        return NSFetchRequest<Students>(entityName: "Students")
    }

    @NSManaged public var fname: String?
    @NSManaged public var lname: String?
    @NSManaged public var number: String?
    @NSManaged public var email: String?
    @NSManaged public var id: Int64

}
