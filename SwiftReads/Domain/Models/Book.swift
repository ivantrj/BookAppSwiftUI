//
//  Item.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski.
//

import Foundation
import SwiftData

@Model
final class Book {
    var name: String
    var date: Date
    var isComplete: Bool

    init(name: String, date: Date, isComplete: Bool) {
        self.name = name
        self.date = date
        self.isComplete = isComplete
    }
}
