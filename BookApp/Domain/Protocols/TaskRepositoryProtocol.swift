//
//  TaskRepositoryProtocol.swift
//  BookApp
//
//  Created by Maros Petrus on 06/03/2024.
//

import Foundation

protocol TaskRepositoryProtocol {
    func getAllTasks() -> [TodoTask]
    func create(task: TodoTask)
    func save()
    func delete(task: TodoTask)
    func toggleCompletion(task: TodoTask)
}
