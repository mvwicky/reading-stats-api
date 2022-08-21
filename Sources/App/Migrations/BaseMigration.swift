import Fluent

protocol BaseMigration: AsyncMigration {
  static var schemaName: String { get }
}

extension BaseMigration {
  func revert(on database: Database) async throws {
    try await database.schema(Self.schemaName).delete()
  }
}
