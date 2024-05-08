//
//  DashboardView.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski.
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
                VStack(alignment: .leading) {
                    ForEach(viewModel.unfinishedTasks, id: \.id) { task in
                        makeCard(image: "circle", title: task.name){
                            viewModel.onTaskTapped(task: task)
                        }
                    }
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
        .alert("Add New Book", isPresented: $viewModel.isShowingAddAlert) {
            TextField("Enter book name", text: $viewModel.newTaskText)
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
                    Text("Add new book")
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
