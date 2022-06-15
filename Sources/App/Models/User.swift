//
//  User.swift
//
//
//  Created by Michael Van Wickle on 6/11/22.
//

import Fluent
import Vapor

final class User: Model, Content {
  static let schema = "users"

  @ID(key: .id)
  var id: UUID?

  @Field(key: "email")
  var email: String

  @Field(key: "password_hash")
  var passwordHash: String

  @Timestamp(key: "created", on: .create)
  var created: Date?

  @Timestamp(key: "modified", on: .update)
  var modified: Date?

  init() {}

  init(_ id: UUID? = nil, email: String, passwordHash: String) {
    self.id = id
    self.email = email
    self.passwordHash = passwordHash
  }

  convenience init(id: UUID? = nil, email: String, password: String) throws {
    self.init(id, email: email, passwordHash: try Bcrypt.hash(password))
  }
}
