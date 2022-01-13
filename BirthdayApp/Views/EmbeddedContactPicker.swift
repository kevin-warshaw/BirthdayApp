//
//  EmbeddedContactPicker.swift
//  BirthdayApp
//
//  Created by Kevin Warshaw on 12/29/21.
//

import Combine
import Contacts
import SwiftUI

struct EmbeddedContactPicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = EmbeddedContactPickerViewController

        final class Coordinator: NSObject, EmbeddedContactPickerViewControllerDelegate {
            @Environment(\.presentationMode) var presentationMode
            var parent: EmbeddedContactPicker
            
            init(_ parent: EmbeddedContactPicker) {
                self.parent = parent
            }
            
            func embeddedContactPickerViewController(_ viewController: EmbeddedContactPickerViewController, didSelect contact: CNContact) {
                viewController.dismiss(animated: true)
                self.parent.contactInfo?.firstName = contact.givenName
                self.parent.contactInfo?.lastName = contact.familyName
                self.parent.contactInfo?.birthday = contact.birthday
                self.parent.contactInfo?.phoneNumber = contact.phoneNumbers
                if let imageData = contact.imageData {
                    self.parent.contactInfo?.image = UIImage(data: imageData)
                }
            }

            func embeddedContactPickerViewControllerDidCancel(_ viewController: EmbeddedContactPickerViewController) {
//                    presentationMode.wrappedValue.dismiss()
                viewController.dismiss(animated: true)
            }
        }
    
    @Binding var contactInfo: ContactInfo?

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<EmbeddedContactPicker>) -> EmbeddedContactPicker.UIViewControllerType {
        let result = EmbeddedContactPicker.UIViewControllerType()
        result.delegate = context.coordinator
        return result
    }

    func updateUIViewController(_ uiViewController: EmbeddedContactPicker.UIViewControllerType, context: UIViewControllerRepresentableContext<EmbeddedContactPicker>) {

    }
}

//struct EmbeddedContactPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        EmbeddedContactPicker()
//    }
//}
