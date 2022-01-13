//
//  ContactTableCell.swift
//  BirthdayApp
//
//  Created by Kevin Warshaw on 12/21/21.
//

import SwiftUI

struct ContactTableCell: View {
    @State private var name: String
    @State private var message: String
    
    init(name: String, message: String) {
        _name = State(initialValue: name)
        _message = State(initialValue: message)
    }
    
    var body: some View {
        HStack {
            Image("TestProfPicture")
                .resizable()
                .clipShape(Circle())
                .frame(width: 75,height: 75, alignment: .center)
                .clipped()
            Spacer()
            VStack {
                Text(name)
                TextField("Message", text: $message)
                    .background(.gray.opacity(0.2))
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct ContactTableCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactTableCell(name: "Kevin Warshaw", message: "Happy birthday Kevin!")
    }
}
