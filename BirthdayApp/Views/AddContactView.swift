//
//  AddContactView.swift
//  BirthdayApp
//
//  Created by Kevin Warshaw on 12/28/21.
//

import ContactsUI
import Foundation
import SwiftUI

struct AddContactView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var isPresented: Bool
    @ObservedObject var contactInfo: ContactInfo?
    @ObservedObject var inputContactInfo: ContactInfo?
    @State var showingContactScreen: Bool = false
    
    func loadContactInfo() {
        guard let contact = self.inputContactInfo else { return }
        self.contactInfo = contact
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: self.contactInfo?.image ?? UIImage())
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                TextField("First Name", text: $contactInfo.firstName.bound)
                TextField("Last Name", text: $contactInfo.lastName.bound)
                TextField("Birthday", text: $contactInfo.lastName.bound) // TODO: Update to date picker
                TextField("Message", text: $contactInfo.message.bound)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        self.isPresented = false
                    }
                    
                    Button("Save") {
                        self.isPresented = false
                    }
                }
            }
            .onAppear(perform: {
                switch(CNContactStore.authorizationStatus(for: .contacts)) {
                case .notDetermined:
                    let store = CNContactStore()
                    store.requestAccess(for: .contacts) { access, error in
                        if let _ = error {
                            // TODO: Add error handling
                            return
                        }
                    }
                    break
                case .authorized:
                    // Show contact picker then add friend screen prepopulated with data
                    self.showingContactScreen = true
                    break
                case .restricted:
                    fallthrough
                case .denied:
                    // Show blank add friend screen
                    break
                
                @unknown default:
                    return
                }
            }).sheet(isPresented: $showingContactScreen, onDismiss: {
                    self.showingContactScreen = false
                }) {
                    EmbeddedContactPicker(contactInfo: $inputContactInfo)
                        .onChange(of: inputContactInfo) { _ in
                            self.loadContactInfo()
                        }
                }
        }
    }
}

//struct AddContactView_Previews: PreviewProvider {
//    static var previews: some View {
//        var test = true
//        let view = AddContactView(isPresented: $test)
////        view.image = UIImage(named: "TestProfPicture") ?? UIImage()
////        view.firstName = "Kevin"
////        view.lastName = "Warshaw"
////        view.birthday = "March"
////        view.message = "Hi"
//    }
//}
