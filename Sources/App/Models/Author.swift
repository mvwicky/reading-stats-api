//
//  Author.swift
//
//
//  Created by Michael Van Wickle on 6/4/22.
//

import Fluent
import Vapor

final class Author: Model, Content {
  static let schema = "authors"

  @ID(key: .id)
  var id: UUID?

  @Field(key: "name")
  var name: String

  init() {}

  init(id: UUID? = nil, name: String) {
    self.id = id
    self.name = name
  }
}
