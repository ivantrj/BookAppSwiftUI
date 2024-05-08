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
    
    @Published private(set) var tasks: [Book] = []
    @Published var isPaywallShown = false
    @Published var wasPaywallShown = false
    @Published var isShowingAddAlert = false
    @Published var newTaskText: String = ""
    
    let taskRepository: BookRepositoryProtocol
    private let onEvent: (Event) -> ()
    
    var finishedTasks: [Book] {
        tasks.filter(\.isComplete)
    }
    
    var unfinishedTasks: [Book] {
        tasks.filter({ !$0.isComplete })
    }
    
    var isProUser: Bool {
        SubscriptionService.shared.isProUser
    }
    
    init(
        taskRepository: BookRepositoryProtocol,
        onEvent: @escaping (Event) -> Void
    ) {
        self.taskRepository = taskRepository
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
                tasks = taskRepository.getAllBooks()
                    .sorted(by: {$0.date > $1.date})
            }
        }
    }
    
    func onSettingsButtonTap() {
        onEvent(.showSettings)
    }
    
    func showPaywall() {
        isPaywallShown.toggle()
    }
    
    func onTaskTapped(task: Book) {
        withAnimation {
            taskRepository.toggleCompletion(book: task)
            objectWillChange.send()
        }
    }
    
    func onAddButtonTapped() {
        isShowingAddAlert = true
    }
    
    func onCreateNewTask() {
        AnalyticsService.shared.log(event: .newTaskCreated)
        let task = Book(
            name: newTaskText,
            date: Date(),
            isComplete: false
        )
        newTaskText = ""
        taskRepository.create(book: task)
        
        Task {
            await loadData()
            
            /// Useful tip: Request review after some core action
            
            await MainActor.run {
                if tasks.count == 1 {
                    SKStoreReviewController.requestReviewInCurrentScene()
                }
            }
        }
    }
    
    func deleteTask(_ task: Book) {
        taskRepository.delete(book: task)
        
        Task {
            await loadData()
        }
    }
}
