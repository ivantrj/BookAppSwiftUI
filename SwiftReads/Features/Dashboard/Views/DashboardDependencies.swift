//
//  DashboardDependencies.swift
//  SwiftReads
//
//  Created by Maros Petrus on 27/03/2024.
//

import Foundation

class DashboardDependencies {

    let bookRepository: BookRepositoryProtocol

    init(bookRepository: BookRepositoryProtocol) {
        self.bookRepository = bookRepository
    }
}
