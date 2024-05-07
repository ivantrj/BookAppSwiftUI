//
//  DashboardView.swift
//  BookApp
//
//  Created by Maros Petrus on 06/03/2024.
//

import SwiftUI
import RevenueCat
import RevenueCatUI

struct DashboardView: View {

    @Environment(\.colorScheme) var colorScheme

    @ObservedObject var viewModel: DashboardViewModel

    /// This code is to showcase the basic flow and separation of business logic from UI.
    /// Replace this code with your own UI and logic your project requires.
    ///
    ///
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if !viewModel.isProUser {
                        makeCard(image: "trophy", title: "Upgrade to BookApp Pro") {
                            viewModel.showPaywall()
                        }
                    } else {
                        makeCard(image: "checkmark.circle.fill", title: "Enjoy your Pro features!")
                    }
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Scheduled tasks")
                        ForEach(viewModel.unfinishedTasks, id: \.id) { task in
                            makeCard(image: "circle", title: task.name) {
                                viewModel.onTaskTapped(task: task)
                            }
                        }
                    }
                    if !viewModel.finishedTasks.isEmpty {
                        Divider()
                        VStack(alignment: .leading) {
                            Text("Finished tasks")
                            ForEach(viewModel.finishedTasks, id: \.id) { task in
                                makeCard(image: "circle.inset.filled", title: task.name) {
                                    viewModel.onTaskTapped(task: task)
                                }
                            }
                        }
                    }
                }
                .padding(16)
            }
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        viewModel.onAddButtonTapped()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
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
        .alert("Create new task", isPresented: $viewModel.isShowingAddAlert) {
            TextField("Enter task text", text: $viewModel.newTaskText)
            Button("OK", action: {
                viewModel.onCreateNewTask()
            })
        } message: {
            Text("")
        }
        .fullScreenCover(isPresented: $viewModel.isPaywallShown, content: {
            SubscriptionService.shared.paywallView
        })
    }

    private func makeAddNewCard() -> some View {
        Button {
            viewModel.onAddButtonTapped()
        } label: {
            VStack {
                HStack {
                    Image(systemName: "plus.circle")
                        .foregroundStyle(Asset.Colors.appPrimary.swiftUIColor)
                    Text("Add new task")
                    Spacer()
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Asset.Colors.appPrimary.swiftUIColor, style: .init(lineWidth: 2, lineCap: .round, lineJoin: .round, miterLimit: .zero, dash: [5], dashPhase: 2))
                    .shadow(color: .black.opacity(0.1), radius: 8)
            )
        }
    }

    private func makeCard(image: String, title: String, action: (() -> ())? = nil) -> some View {
        Button {
            action?()
        } label: {
            VStack {
                HStack {
                    Image(systemName: image)
                        .foregroundStyle(Asset.Colors.appPrimary.swiftUIColor)
                    Text(title)
                    Spacer()
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Asset.Colors.cardBackground.swiftUIColor)
                    .shadow(color: .black.opacity(0.1), radius: 8)
            )
        }
        .disabled(action == nil)
    }
}
