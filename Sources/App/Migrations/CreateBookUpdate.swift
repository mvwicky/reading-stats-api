import Fluent

struct CreateBookUpdateMigration: BaseMigration {
  static let schemaName: String = "book_updates"

  func prepare(on database: Database) async throws {
    try await database.schema(Self.schemaName)
      .id()
      .field("page", .int)
      .field("location", .int)
      .field("created", .datetime)
      .field("book", .uuid, .required, .references("books", "id"))
      .create()
  }
}
