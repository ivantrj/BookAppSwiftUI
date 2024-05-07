//
//  DashboardDependencies.swift
//  SwiftReads
//
//  Created by Maros Petrus on 27/03/2024.
//

import Foundation

class DashboardDependencies {

    let taskRepository: BookRepositoryProtocol

    init(taskRepository: BookRepositoryProtocol) {
        self.taskRepository = taskRepository
    }
}
