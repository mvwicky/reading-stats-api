import Fluent

struct CreateBook: AsyncMigration {
  func prepare(on database: Database) async throws {
    try await database.schema("books")
      .id()
      .field("title", .string, .required)
      .field("pub_year", .uint, .required)
      .field("total_pages", .uint)
      .field("max_location", .uint)
      .field("pages_read", .uint, .required)
      .field("location", .uint, .required)
      .field("started", .datetime)
      .field("finished", .datetime)
      .field("off", .uint, .required)
      .field("created", .datetime)
      .field("modified", .datetime)
      .field("author_id", .uuid, .required, .references("authors", "id"))
      .create()
  }

  func revert(on database: Database) async throws {
    try await database.schema("books").delete()
  }
}
