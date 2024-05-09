//
//  EditBookViewModel.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski  on 09.05.24.
//

import Foundation

class EditBookViewModel: ObservableObject {
    @Published var book: Book
    @Published var selectedStatus: Status
    
    private let bookRepository: BookRepositoryProtocol
    
    init(book: Book, bookRepository: BookRepositoryProtocol) {
        self.book = book
        self.selectedStatus = book.status
        self.bookRepository = bookRepository
    }
    
    func saveChanges() {
        book.status = selectedStatus
        bookRepository.save()
    }
}
