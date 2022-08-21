import Fluent

struct CreateUserTokenMigration: BaseMigration {
  static let schemaName: String = "user_tokens"

  func prepare(on database: Database) async throws {
    try await database.schema(Self.schemaName)
      .id()
      .field("value", .string, .required)
      .field("user_id", .uuid, .required, .references("users", "id"))
      .unique(on: "user_id")
      .create()
  }
}
