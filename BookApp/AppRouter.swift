//
//  AppRouter.swift
//  BookApp
//
//  Created by Maros Petrus on 06/03/2024.
//

import UIKit
import SwiftUI
import StoreKit

/// This is the main AppRouter
/// All features and flow starts here and this router decides what flow to start.
///
///
class AppRouter {

    let dependencies: AppDependencies
    let mainNavigationController: UINavigationController

    init(
        dependencies: AppDependencies,
        mainNavigationController: UINavigationController
    ) {
        self.dependencies = dependencies
        self.mainNavigationController = mainNavigationController
    }

    func start() {
        Task {
            await SubscriptionService.shared.loadProStatus()
            await MainActor.run {
                if dependencies.userRepository.isUserLoggedIn() {
                    showDashboard()
                } else if dependencies.userRepository.onboardingIsFinished() {
                    showSignIn()
                } else {
                    showOnboarding()
                }
            }
        }
    }

    lazy var signInViewModel = SignInViewModel(
        userRepository: dependencies.userRepository, onEvent: { event in
            switch event {
            case .signInSuccessful:
                self.showDashboard()
            }
        }
    )

    private func showOnboarding() {
        OnboardingManager(
            dependencies: dependencies.onboardingDependencies,
            navigationController: mainNavigationController,
            delegate: self
        ).start()
    }

    private func showSignIn() {
        let view = SignInView(
            viewModel: signInViewModel
        )
        mainNavigationController.pushView(view)
    }

    private func showDashboard() {
        DashboardManager(
            dependencies: dependencies.dashboardDependencies,
            navigationController: mainNavigationController,
            delegate: self
        ).start()
    }

    private func showSettings() {
        let settingsViewModel = SettingsViewModel { event in
            switch event {
            case .logout:
                self.mainNavigationController.topViewController?.dismiss(animated: true, completion: {
                    self.dependencies.userRepository.signOut()
                    self.showSignIn()
                })
            case .deleteAccount:
                self.dependencies.userRepository.deleteAccount()
                self.mainNavigationController.topViewController?.dismiss(animated: true, completion: {
                    self.showSignIn()
                })
            }
        }
        let view = SettingsView(viewModel: settingsViewModel)
        let hostingController = UIHostingController(rootView: view)
        hostingController.modalPresentationStyle = .fullScreen
        mainNavigationController.present(hostingController, animated: true)
    }
}

extension AppRouter: OnboardingDelegate {
    func didFinishOnboarding() {
        dependencies.userRepository.setOnboardingIsFinished()

        /// Useful tip: Request review right after onboarding
        SKStoreReviewController.requestReviewInCurrentScene()

        showSignIn()
    }
}

extension AppRouter: DashboardDelegate {
    func didTapSettings() {
        showSettings()
    }
}
