//
//  DashboardViewModel.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski.
//

import SwiftUI
import Mixpanel
import StoreKit

/// ViewModels communicate with interactors and repositories
/// ViewModels are envoking events that happen on the UI and delegate them further to AppRouter
///
///
class DashboardViewModel: ObservableObject {
    
    enum Event {
        case showSettings
    }
    
    @Published private(set) var books: [Book] = []
    @Published var isPaywallShown = false
    @Published var wasPaywallShown = false
    @Published var newBookText: String = ""
    
    let bookRepository: BookRepositoryProtocol
    private let onEvent: (Event) -> ()
    
    
    var fetchBooks: [Book] {
        books
    }
    
    var isProUser: Bool {
        SubscriptionService.shared.isProUser
    }
    
    init(
        bookRepository: BookRepositoryProtocol,
        onEvent: @escaping (Event) -> Void
    ) {
        self.bookRepository = bookRepository
        self.onEvent = onEvent
    }
    
    func onAppear() {
        Task {
            await loadData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if !self.isProUser {
                    if !self.wasPaywallShown {
                        self.wasPaywallShown.toggle()
                        self.isPaywallShown.toggle()
                    }
                }
            }
        }
    }
    
    func loadData() async {
        await SubscriptionService.shared.loadProStatus()
        await MainActor.run {
            withAnimation {
                books = bookRepository.getAllBooks()
//                    .sorted(by: {$0.date > $1.date})
            }
        }
    }
    
    func onSettingsButtonTap() {
        onEvent(.showSettings)
    }
    
    func showPaywall() {
        isPaywallShown.toggle()
    }
    
    func onCreateNewBook(status: Status? = nil) {
        AnalyticsService.shared.log(event: .newBookCreated)
        _ = status ?? .wantToRead
        
        let newBook = Book(
            name: newBookText,
            author: "",
            genre: "",
            status: .wantToRead,
            date: Date()
        )
        newBookText = ""
        bookRepository.create(book: newBook)
        
        Task {
            await loadData()
            
            /// Useful tip: Request review after some core action
            
            await MainActor.run {
                if books.count == 1 {
                    SKStoreReviewController.requestReviewInCurrentScene()
                }
            }
        }
    }
    
    func deleteBook(_ task: Book) {
        bookRepository.delete(book: task)
        
        Task {
            await loadData()
        }
    }
}
