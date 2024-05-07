//
//  DashboardViewModel.swift
//  BookApp
//
//  Created by Maros Petrus on 06/03/2024.
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

    @Published private(set) var tasks: [TodoTask] = []
    @Published var isPaywallShown = false
    @Published var wasPaywallShown = false
    @Published var isShowingAddAlert = false
    @Published var newTaskText: String = ""

    let taskRepository: TaskRepositoryProtocol
    private let onEvent: (Event) -> ()

    var finishedTasks: [TodoTask] {
        tasks.filter(\.isComplete)
    }

    var unfinishedTasks: [TodoTask] {
        tasks.filter({ !$0.isComplete })
    }

    var isProUser: Bool {
        SubscriptionService.shared.isProUser
    }

    init(
        taskRepository: TaskRepositoryProtocol,
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
                tasks = taskRepository.getAllTasks()
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

    func onTaskTapped(task: TodoTask) {
        withAnimation {
            taskRepository.toggleCompletion(task: task)
            objectWillChange.send()
        }
    }

    func onAddButtonTapped() {
        isShowingAddAlert = true
    }

    func onCreateNewTask() {
        AnalyticsService.shared.log(event: .newTaskCreated)
        let task = TodoTask(
            name: newTaskText,
            date: Date(),
            isComplete: false
        )
        newTaskText = ""
        taskRepository.create(task: task)
        
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
}
