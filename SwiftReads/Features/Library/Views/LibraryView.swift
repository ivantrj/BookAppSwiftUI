//
//  LibraryView.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski  on 07.05.24.
//

import SwiftUI

struct LibraryView: View {
    @State private var selectedOption = Status.reading
    
    @ObservedObject var viewModel: DashboardViewModel
    
    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Picker(selection: $selectedOption, label: Text("Select Option")) {
                        ForEach(filteredStatuses, id: \.self) { status in
                            Text("\(status.status)").tag(status)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    
                    ForEach(filteredBooks) { book in
                        BookRow(book: book)
                    }
                    .padding()
                }
                .padding()
            }
            .navigationTitle("Library")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing:
                    Button {
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                    }
            )
        }
    }
    
    private var filteredBooks: [Book] {
        viewModel.books.filter { $0.status == selectedOption }
    }
    
    private var filteredStatuses: [Status] {
        return Status.allCases.filter { $0 == .reading || $0 == .read }
    }
}

struct BookRow: View {
    let book: Book
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(book.name)
                    .font(.headline)
                Text(book.author)
                    .font(.subheadline)
                Text(book.genre)
                    .font(.subheadline)
            }
            Spacer()
            //            Text(book.status)
            //                .foregroundColor(statusColor(for: book.status))
        }
        .padding()
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(10)
        .padding(.vertical, 4)
    }
    
    private func statusColor(for status: Status) -> Color {
        switch status {
        case .wantToRead:
            return .blue
        case .reading:
            return .orange
        case .read:
            return .green
        }
    }
}


//
//#Preview {
//    LibraryView()
//}
