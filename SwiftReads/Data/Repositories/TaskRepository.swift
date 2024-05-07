//
//  TaskRepository.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski.
//

import SwiftData

class TaskRepository: TaskRepositoryProtocol {

    let swiftDataDatasource: SwiftDataDatasource

    init(swiftDataDatasource: SwiftDataDatasource) {
        self.swiftDataDatasource = swiftDataDatasource
    }

    func getAllTasks() -> [TodoTask] {
        swiftDataDatasource.getAll(type: TodoTask.self)
    }

    func create(task: TodoTask) {
        swiftDataDatasource.create(type: TodoTask.self, model: task)
    }
    
    func save() {
        swiftDataDatasource.save(type: TodoTask.self)
    }
    
    func delete(task: TodoTask) {
        swiftDataDatasource.delete(type: TodoTask.self, model: task)
    }
    
    func toggleCompletion(task: TodoTask) {
        task.isComplete.toggle()
        save()
    }
}
