//
//  File.swift
//  
//
//  Created by Ivan Trajanovski
//

import UIKit
import SwiftUI

struct OnboardingManager {
    private let dependencies: OnboardingDependencies
    private let navigationController: UINavigationController
    private let delegate: OnboardingDelegate

    init(
        dependencies: OnboardingDependencies,
        navigationController: UINavigationController,
        delegate: OnboardingDelegate
    ) {
        self.dependencies = dependencies
        self.navigationController = navigationController
        self.delegate = delegate
    }

    public func start() {
        // TODO: Analytics
        let splashView = SplashView { event in
            switch event {
            case .startButtonTapped:
                navigationController.pushView(OnboardingView(onEvent: { event in
                    switch event {
                    case .finishButtonTapped, .skipButtonTapped:
                        delegate.didFinishOnboarding()
                    }
                }))
            }
        }
        navigationController.pushView(splashView)
    }
}
