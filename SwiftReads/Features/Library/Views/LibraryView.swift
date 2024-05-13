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
        NavigationView {
            VStack {
                Picker(selection: $selectedOption, label: Text("Select Option")) {
                    ForEach(filteredStatuses, id: \.self) { status in
                        Text("\(status.status)").tag(status)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                        ForEach(filteredBooks) { book in
                            BookRow(book: book)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            .navigationTitle("Library")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                Button(action: {
                    // Add action for trailing button if needed
                }) {
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
        VStack(alignment: .leading, spacing: 8) {
            Text(book.name)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text("By \(book.author)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(book.genre)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                Spacer()
                Text("\(book.status)")
                    .font(.caption)
                    .foregroundColor(statusColor(for: book.status))
            }
        }
        .padding(12)
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
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
