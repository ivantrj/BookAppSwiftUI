//
//  AddBookView.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski  on 08.05.24.
//

import SwiftUI

struct AddBookView: View {
    @State private var bookName = ""

    var body: some View {
        VStack(spacing: 20) {
            SailTextField(title: "Book", placeholder: "Add New Book", text: $bookName)
            
            
            SailButton(
                style: .primary,
                action: {},
                icon: Image(systemName: "square.and.arrow.down"),
                title: "Add"
            )
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AddBookView()
}
