//
//  ContactInfo.swift
//  BirthdayApp
//
//  Created by Kevin Warshaw on 1/2/22.
//

import ContactsUI
import Foundation
import SwiftUI

class ContactInfo: ObservableObject {
    @Published var image: UIImage?
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var birthday: DateComponents?
    @Published var phoneNumber: [CNLabeledValue<CNPhoneNumber>]?
    @Published var message: String = ""
}
