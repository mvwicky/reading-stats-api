//
//  BookUpdate.swift
//
//
//  Created by Michael Van Wickle on 6/11/22.
//

import Fluent
import Vapor

final class BookUpdate: Model, Content {
  static let schema = "book_updates"

  @ID(key: .id)
  var id: UUID?

  @OptionalField(key: "page")
  var page: Int?

  @OptionalField(key: "location")
  var location: Int?

  @Timestamp(key: "created", on: .create)
  var created: Date?

  @Parent(key: "book_id")
  var book: Book

  init() {}

  init(_ id: UUID? = nil, page: Int, bookId: Book.IDValue) {
    self.id = id
    self.page = page
    $book.id = bookId
  }

  init(_ id: UUID? = nil, location: Int, bookId: Book.IDValue) {
    self.id = id
    self.location = location
    $book.id = bookId
  }
}
