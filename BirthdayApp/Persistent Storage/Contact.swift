//
//  Contact.swift
//  BirthdayApp
//
//  Created by Kevin Warshaw on 12/27/21.
//

import Foundation
import CoreData

@objc(Contact)
class Contact: NSManagedObject, Identifiable {
    @NSManaged var name: String
    @NSManaged var message: String
}
