//
//  CreateAuthor.swift
//
//
//  Created by Michael Van Wickle on 6/4/22.
//

import Fluent

struct CreateAuthorMigration: AsyncMigration {
  func prepare(on database: Database) async throws {
    try await database.schema("authors").id().field("name", .string, .required).create()
  }

  func revert(on database: Database) async throws {
    try await database.schema("authors").delete()
  }
}
