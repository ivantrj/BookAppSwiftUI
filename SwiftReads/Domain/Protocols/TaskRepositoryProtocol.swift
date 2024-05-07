//
//  TaskRepositoryProtocol.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski.
//

import Foundation

protocol TaskRepositoryProtocol {
    func getAllTasks() -> [TodoTask]
    func create(task: TodoTask)
    func save()
    func delete(task: TodoTask)
    func toggleCompletion(task: TodoTask)
}
