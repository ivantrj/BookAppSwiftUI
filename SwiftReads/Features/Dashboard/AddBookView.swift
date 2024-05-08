//
//  AddBookView.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski  on 08.05.24.
//

import SwiftUI

struct AddBookView: View {
    @ObservedObject var viewModel: DashboardViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            SailTextField(title: "Book", placeholder: "Add New Book", text: $viewModel.newTaskText)
            
            
            SailButton(
                style: .primary,
                action: {
                    viewModel.onCreateNewBook()
                    presentationMode.wrappedValue.dismiss() 
                },                icon: Image(systemName: "square.and.arrow.down"),
                title: "Add"
            )
            
            Spacer()
        }
        .padding()
    }
}

//#Preview {
//    AddBookView()
//}
