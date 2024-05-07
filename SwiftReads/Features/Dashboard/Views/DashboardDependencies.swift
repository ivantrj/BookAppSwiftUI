//
//  DashboardDependencies.swift
//  SwiftReads
//
//  Created by Maros Petrus on 27/03/2024.
//

import Foundation

class DashboardDependencies {

    let taskRepository: TaskRepositoryProtocol

    init(taskRepository: TaskRepositoryProtocol) {
        self.taskRepository = taskRepository
    }
}
