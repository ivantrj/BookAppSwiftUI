//
//  ContentView.swift
//  BookApp
//
//  Created by Maros Petrus on 06/03/2024.
//

import SwiftUI
import SwiftData

/// Add your tabs into the TabView here
/// Change the color of the NavitaionBar here
/// To change the primary color in the entire app, go to Presentation > Resources > Colors.xcassets and change the primary color
///
///
struct ContentView: View {

    init(dashboardViewModel: DashboardViewModel) {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: Asset.Colors.appPrimary.color]
        self.dashboardViewModel = dashboardViewModel
    }

    let dashboardViewModel: DashboardViewModel

    var body: some View {
        TabView {
            DashboardView(viewModel: dashboardViewModel)
                .tabItem {
                    Label("Dashboard", systemImage: "house.fill")
                }
            ComponentsView()
                .tabItem {
                    Label("UI Components", systemImage: "batteryblock")
                }
        }
        .tint(Asset.Colors.appPrimary.swiftUIColor)
        .font(.defaultText.regular)
    }
}


/// UI Components showcase
///
///
struct ComponentsView: View {
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Button")
                        .font(.title.medium)
                    SailButton(
                        style: .primary,
                        action: {},
                        icon: Image(systemName: "apple.logo"),
                        title: "Sign in with Apple"
                    )
                    SailButton(
                        style: .secondary,
                        action: {},
                        icon: Image(systemName: "checkmark.circle"),
                        title: "I agree"
                    )
                    SailButton(
                        style: .neutral,
                        action: {},
                        icon: Image(systemName: "apple.logo"),
                        title: "Sign in with Apple"
                    )
                    SailButton(
                        style: .link,
                        action: {},
                        icon: Image(systemName: "checkmark.circle"),
                        title: "I agree"
                    )
                }
                .padding(16)
                VStack(alignment: .leading, spacing: 16) {
                    Text("Card")
                        .font(.title.medium)
                    Card(
                        title: "Create account",
                        description: "Fill out this form to create account",
                        spacing: 16
                    ) {
                        SailTextField(
                            title: "Email address",
                            placeholder: "email@example.com",
                            rightIcon: "at.circle.fill",
                            text: .constant("")
                        )
                        SailTextField(
                            title: "Password",
                            placeholder: "Create password...",
                            rightIcon: "lock.circle.fill",
                            text: .constant("")
                        )
                        SailTextField(
                            title: "Confirm password",
                            placeholder: "Confirm password...",
                            rightIcon: "checkmark.circle.fill",
                            text: .constant("")
                        )
                        SailButton(
                            action: {
                                // Action...
                            },
                            icon: Image(systemName: "checkmark.circle.fill"),
                            title: "Create account"
                        )
                    }
                    Card(
                        title: "Notifications",
                        description: "You have 3 unread messages.",
                        spacing: 16
                    ) {
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 8))
                                .foregroundStyle(Asset.Colors.appPrimary.swiftUIColor)
                            VStack(alignment: .leading) {
                                Text("Your payment was successfull!")
                                Text("32 minutes ago")
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                            }
                        }
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 8))
                                .foregroundStyle(Asset.Colors.appPrimary.swiftUIColor)
                            VStack(alignment: .leading) {
                                Text("You have received a new message.")
                                Text("1 hour ago")
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                            }
                        }
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 8))
                                .foregroundStyle(Asset.Colors.appPrimary.swiftUIColor)
                            VStack(alignment: .leading) {
                                Text("Your account was created!")
                                Text("2 days ago")
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    Card(
                        title: "Notifications",
                        icon: "checkmark.circle.fill",
                        description: "No new notifications..."
                    )
                }
                .padding(16)
                VStack(alignment: .leading, spacing: 16) {
                    Text("Textfield")
                        .font(.title.medium)
                    SailTextField(
                        title: "Email address with right icon",
                        placeholder: "email@address.com",
                        rightIcon: "at.circle.fill",
                        text: .constant("")
                    )
                    SailTextField(
                        title: "Email address with left icon",
                        placeholder: "email@address.com",
                        leftIcon: "at.circle.fill",
                        text: .constant("")
                    )
                    SailTextField(
                        title: "Email address (disabled)",
                        placeholder: "email@address.com",
                        rightIcon: "at.circle.fill",
                        disabled: .constant(true),
                        text: .constant("")
                    )
                    SailTextField(
                        title: "Email address (error)",
                        placeholder: "email@address.com",
                        rightIcon: "at.circle.fill",
                        error: "Email must be in the correct format",
                        disabled: .constant(false),
                        text: .constant("email@example")
                    )
                }
                .padding(16)
                VStack(alignment: .leading) {
                    Text("Accordion")
                        .font(.title.medium)
                    Accordion(items: [
                        AccordionItem(
                            title: "Why should I choose BookApp?",
                            description: "Because BookApp is not just another boilerplate template. Yes, you'll get the full Xcode project will all the features and UI components. But you'll also get my years of experience in selling subscriptions and making money on the AppStore. I will share with you everything I know about selling strategies like when to show the paywall, what subscription to offer, when to ask for review, how to setup your keywords, title, subtitle of your app, and many more..."
                        ),
                        AccordionItem(
                            title: "What if I want a slightly different tech stack?",
                            description: "In this case, you can email me at me@marospetrus.com and I'll take care of the next steps!"
                        ),
                        AccordionItem(
                            title: "Is BookApp for beginners?",
                            description: "Of course it is! BookApp Xcode project is built on top of the clean architecture and best coding practices. I would encourage everyone to dive into that! It will help tremendously not only your project but also your career as iOS Developer as many companies require some knowledge of the clean architecture and SOLID principles."
                        ),
                        AccordionItem(
                            title: "Is BookApp being continuosly updated?",
                            description: "Yes, I am constantly working on improving this code based on my current needs for my apps. BookApp gets updates based on customers feedback, new iOS versions, bug fixes, and so on..."
                        )
                    ])
                }
                .padding(16)
                VStack(alignment: .leading, spacing: 16) {
                    Text("Banner")
                        .font(.title.medium)
                    Banner(
                        style: .info,
                        icon: "questionmark.app.fill",
                        title: "Did you know?",
                        description: "You can upgrade to Pro to get all the amazing features!"
                    )
                    Banner(
                        style: .error,
                        icon: "externaldrive.fill.trianglebadge.exclamationmark",
                        title: "Something went wrong",
                        description: "There was an error while saving your post!"
                    )
                    Banner(
                        style: .success,
                        icon: "checkmark.circle.fill",
                        title: "Post created",
                        description: "Your post was created and will appear on the Dashboard"
                    )
                }
                .padding(16)
                VStack(alignment: .leading, spacing: 16) {
                    Text("Badge")
                        .font(.title.medium)
                        .frame(maxWidth: .infinity)
                    Badge(style: .primary, text: "Primary")
                    Badge(style: .secondary, text: "Secondary")
                    Badge(style: .outline, text: "Outline")
                    Badge(style: .destructive, text: "Destructive")
                }
                .padding(16)
                VStack(alignment: .leading) {
                    Text("Checkbox")
                        .font(.title.medium)
                    Checkbox(title: "Check this if you want", isChecked: .constant(false))
                        .frame(maxWidth: .infinity)
                }
                .padding(16)
            }
        }
    }
}

#Preview(body: {
    ComponentsView()
})
