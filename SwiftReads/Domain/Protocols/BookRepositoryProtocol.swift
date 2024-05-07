//
//  TaskRepositoryProtocol.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski.
//

import Foundation

protocol BookRepositoryProtocol {
    func getAllBooks() -> [Book]
    func create(book: Book)
    func save()
    func delete(book: Book)
    func toggleCompletion(book: Book)
}
