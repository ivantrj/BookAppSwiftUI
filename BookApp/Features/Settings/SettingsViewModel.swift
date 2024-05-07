//
//  SettingsViewModel.swift
//  BookApp
//
//  Created by Maros Petrus on 24/03/2024.
//

import Foundation
import MessageUI
import SwiftUI

class SettingsViewModel: ObservableObject {

    @Published var isLoadingRestoration = false
    @Published var isShowingMailComposer = false
    @Published var isShowingAboutAuthorView = false
    @Published var isShowingManageSubscriptionsSheet = false

    enum Event {
        case logout
        case deleteAccount
    }

    let onEvent: (Event) -> ()

    init(onEvent: @escaping (Event) -> Void) {
        self.onEvent = onEvent
    }

    func handleItemTap(_ item: SettingsItem) {
        switch item {
        case .manageSubscriptions: isShowingManageSubscriptionsSheet = true
        case .restorePurchase: restorePurchase()
        case .aboutAuthor:
            isShowingAboutAuthorView = true
        case .reportBug:
            // TODO: Coming soon!
            break
        case .messageUs:
            messageUs()
        case .writeReview:
            /// Replace `[app_id]` in the URL below to redirect the user to your app's AppStore page
            ///
            ///
            guard let url = URL(string: "https://apps.apple.com/app/id[app_id]?action=write-review") else { return }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        case .signOut: 
            onEvent(.logout)
        case .deleteAccount:
            onEvent(.deleteAccount)
        }
    }

    func restorePurchase() {
        Task {
            await MainActor.run { isLoadingRestoration = true }
            let result = await SubscriptionService.shared.restorePurchase()
            await MainActor.run(body: {
                isLoadingRestoration = false
                switch result {
                case .success(let restored):
                    if restored {
                        UIApplication.showAlert(title: "Purchase restored", message: "Your purchase was successfully restored. All of the Pro feature were unlocked!")
                    } else {
                        UIApplication.showAlert(title: "Purchase not found", message: "Your purchase was not restored because it was not found. If you think this is a mistake, please reach out at \(Constants.supportEmail)")
                    }
                case .failure(_):
                    UIApplication.showAlert(title: "Purchase restoration failed", message: "An unknown error occured while restoring your purchase. Please try again later or contact support at \(Constants.supportEmail)")
                }
            })
        }
    }

    func messageUs() {
        if MFMailComposeViewController.canSendMail() {
            isShowingMailComposer = true
        }
    }

    var versionString: String {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        let buildNumber = Bundle.main.infoDictionary?[kCFBundleVersionKey as String] as? String
        return "Version \(appVersion ?? "") (\(buildNumber ?? ""))"
    }

    enum SettingsSection: CaseIterable {
        case personal
        case membership
        case help
        case signOut

        var id: UUID {
            UUID()
        }

        var name: String {
            switch self {
            case .personal: return "Personal settings"
            case .membership: return "Membership"
            case .help: return "Help"
            case .signOut: return ""
            }
        }

        var items: [SettingsItem] {
            switch self {
            case .personal: return [.manageSubscriptions]
            case .membership: return [.restorePurchase]
            case .help: return [.aboutAuthor, .reportBug, .messageUs, .writeReview]
            case .signOut: return [.deleteAccount, .signOut]
            }
        }
    }

    enum SettingsItem: CaseIterable {
        case manageSubscriptions
        case restorePurchase
        case aboutAuthor
        case reportBug
        case messageUs
        case writeReview
        case signOut
        case deleteAccount

        var id: UUID {
            UUID()
        }

        var name: String {
            switch self {
            case .manageSubscriptions: return "Manage Subscriptions"
            case .restorePurchase: return "Restore Purchase"
            case .aboutAuthor: return "About Author"
            case .reportBug: return "Report a Bug"
            case .messageUs: return "Send Us a Message"
            case .writeReview: return "Write a Review"
            case .deleteAccount: return "Delete account"
            case .signOut: return "Sign Out"
            }
        }

        var icon: String {
            switch self {
            case .manageSubscriptions: return "person.circle"
            case .restorePurchase: return "dollarsign.arrow.circlepath"
            case .aboutAuthor: return "person"
            case .reportBug: return "ladybug"
            case .messageUs: return "envelope"
            case .writeReview: return "star"
            case .deleteAccount: return "trash"
            case .signOut: return "door.left.hand.open"
            }
        }

        var isDestructive: Bool {
            switch self {
            case .signOut: return true
            default: return false
            }
        }
    }

}
