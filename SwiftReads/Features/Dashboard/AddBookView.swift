//
//  AddBookView.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski  on 08.05.24.
//

import SwiftUI

struct AddBookView: View {
    @ObservedObject var viewModel: DashboardViewModel
    @State private var selectedStatus = Status.wantToRead
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            SailTextField(title: "Book", placeholder: "Add New Book", text: $viewModel.newBookText)
            
            Picker(selection: $selectedStatus, label: Text("Status")) {
                ForEach(Status.allCases) { status in
                    Text(status.status).tag(status)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            
            SailButton(
                style: .primary,
                action: {
                    viewModel.onCreateNewBook(status: selectedStatus)
                    presentationMode.wrappedValue.dismiss()
                },                
                icon: Image(systemName: "square.and.arrow.down"),
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
