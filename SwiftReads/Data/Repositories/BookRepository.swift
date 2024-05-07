//
//  TaskRepository.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski.
//

import SwiftData

class BookRepository: BookRepositoryProtocol {

    let swiftDataDatasource: SwiftDataDatasource

    init(swiftDataDatasource: SwiftDataDatasource) {
        self.swiftDataDatasource = swiftDataDatasource
    }

    func getAllBooks() -> [Book] {
        swiftDataDatasource.getAll(type: Book.self)
    }

    func create(book: Book) {
        swiftDataDatasource.create(type: Book.self, model: book)
    }
    
    func save() {
        swiftDataDatasource.save(type: Book.self)
    }
    
    func delete(book: Book) {
        swiftDataDatasource.delete(type: Book.self, model: book)
    }
    
    func toggleCompletion(book: Book) {
        book.isComplete.toggle()
        save()
    }
}
