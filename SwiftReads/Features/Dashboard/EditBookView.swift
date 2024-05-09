//
//  EditBookView.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski  on 09.05.24.
//

import SwiftUI

struct EditBookView: View {
    @ObservedObject var viewModel: EditBookViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(book: Book, bookRepository: BookRepositoryProtocol) {
        self.viewModel = EditBookViewModel(book: book, bookRepository: bookRepository)
    }
    
    var body: some View {
        VStack {
            TextField("Book Name", text: $viewModel.book.name)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(10)
                .padding(.vertical, 4)
            
            TextField("Author", text: $viewModel.book.author)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(10)
                .padding(.vertical, 4)
            
            TextField("Genre", text: $viewModel.book.genre)
                .padding()
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(10)
                .padding(.vertical, 4)
            
            Picker("Status", selection: $viewModel.selectedStatus) {
                ForEach(Status.allCases) { status in
                    Text(status.status).tag(status)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            SailButton(
                style: .primary,
                action: {
                    viewModel.saveChanges()
                    presentationMode.wrappedValue.dismiss()
                },
                icon: Image(systemName: "square.and.arrow.down"),
                title: "Save Changes"
            )
        }
        .padding()
        .navigationTitle("Edit Book")
    }
}


//#Preview {
//    EditBookView()
//}
