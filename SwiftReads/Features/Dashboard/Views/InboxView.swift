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
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(filteredBooks, id: \.id) { book in
                        makeCard(image: "book", title: book.name, status: book.status)
                            .onTapGesture {
                                selectedBook = book
                                isEditBookSheetPresented = true
                            }
                    }
                    .onDelete(perform: deleteBook)
                }
                .padding(16)
            }
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
    
    private func makeCard(image: String, title: String, status: Status) -> some View {
        VStack {
            HStack {
                Image(systemName: image)
                    .foregroundStyle(Asset.Colors.appPrimary.swiftUIColor)
                Text(title)
                    .font(.title2)
                    .foregroundStyle(Color.black)
                Spacer()
                Text("\(status)")
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
    
    
    private var filteredBooks: [Book] {
        viewModel.books.filter { $0.status == .wantToRead }
    }
    
    private func deleteBook(at offsets: IndexSet) {
        for index in offsets {
            viewModel.deleteBook(filteredBooks[index])
        }
    }
}
