//
//  CreateUser.swift
//
//
//  Created by Michael Van Wickle on 6/11/22.
//

import Fluent

struct CreateUserMigration: AsyncMigration {
  func prepare(on database: Database) async throws {
    try await database.schema("users")
      .id()
      .field("email", .string, .required)
      .field("password_hash", .string, .required)
      .field("created", .datetime)
      .field("modified", .datetime)
      .unique(on: "email")
      .create()
  }

  func revert(on database: Database) async throws {
    try await database.schema("users").delete()
  }
}
