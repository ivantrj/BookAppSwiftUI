//
//  DashboardManager.swift
//  SwiftReads
//
//  Created by Maros Petrus on 27/03/2024.
//

import UIKit
import SwiftUI

/// DashboardManager is the starting point for the Dashboard feature
/// Dependencies are injected through AppRouter
/// Manager should start its flow on the navigation controller that is passed here
/// In this case, Dashboard Manager also starts the main TabBar view and it's considered to be the starting point for a logged in user.
///
struct DashboardManager {

    private let dependencies: DashboardDependencies
    private let navigationController: UINavigationController
    private let delegate: DashboardDelegate

    init(
        dependencies: DashboardDependencies,
        navigationController: UINavigationController,
        delegate: DashboardDelegate
    ) {
        self.dependencies = dependencies
        self.navigationController = navigationController
        self.delegate = delegate
    }

    public func start() {
        let dashboardViewModel = DashboardViewModel(
            taskRepository: dependencies.taskRepository,
            onEvent: { event in
                switch event {
                case .showSettings:
                    self.delegate.didTapSettings()
                }
            }
        )
        let view = ContentView(
            dashboardViewModel: dashboardViewModel
        )
        navigationController.pushView(view)
    }
}
