//
//  DashboardView.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski.
//

import SwiftUI
import RevenueCat
import RevenueCatUI

struct InboxView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var viewModel: DashboardViewModel
    @State private var selectedBook: Book?
    @State private var isEditBookSheetPresented = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredBooks) { book in
                    BookCard(book: book)
                        .onTapGesture {
                            selectedBook = book
                            isEditBookSheetPresented = true
                        }
                }
                .onDelete(perform: deleteBook)
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Inbox")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if !viewModel.isProUser {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            viewModel.showPaywall()
                        } label: {
                            Image(systemName: "crown")
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.onSettingsButtonTap()
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
        }
        .onAppear(perform: {
            viewModel.onAppear()
        })
        .fullScreenCover(isPresented: $viewModel.isPaywallShown, content: {
            SubscriptionService.shared.paywallView
        })
        .sheet(isPresented: $isEditBookSheetPresented) {
            if let selectedBook = selectedBook {
                EditBookView(book: selectedBook, bookRepository: viewModel.bookRepository)
            }
        }
    }
    
    private var filteredBooks: [Book] {
        viewModel.books.filter { $0.status == .wantToRead }
    }
    
    private func deleteBook(at offsets: IndexSet) {
        for index in offsets {
            viewModel.deleteBook(filteredBooks[index])
        }
    }
}

struct BookCard: View {
    let book: Book
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "book")
                    .foregroundStyle(Asset.Colors.appPrimary.swiftUIColor)
                Text(book.name)
                    .font(.title2)
                    .foregroundStyle(Color.black)
                Spacer()
                Text("\(book.status)")
                    .font(.caption)
                
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Asset.Colors.cardBackground.swiftUIColor)
                    .shadow(color: .black.opacity(0.1), radius: 8)
            )
        }
    }
}
