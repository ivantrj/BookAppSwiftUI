//
//  Item.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski.
//

import Foundation
import SwiftData

enum Status: Int, Codable, CaseIterable, Identifiable {
    case wantToRead = 1
    case reading
    case read
    
    var id: Int {
        rawValue
    }
}

extension Status {
    var status: String {
        switch self {
            case .wantToRead:
                return "Want to Read"
            case .reading:
                return "Reading"
            case .read:
                return "Read"
        }
    }
}


@Model
final class Book {
    var name: String
    var author: String
    var genre: String
    var status: Status
    var date: Date

    init(name: String, author: String, genre: String, status: Status, date: Date) {
        self.name = name
        self.author = author
        self.genre = genre
        self.status = status
        self.date = date
    }
}
