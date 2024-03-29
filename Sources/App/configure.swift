import Fluent
import FluentPostgresDriver
import Vapor

public func configure(_ app: Application) throws {
  app.databases.use(.postgres(
    hostname: Environment.get("DATABASE_HOST") ?? "localhost",
    port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration
      .ianaPortNumber,
    username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
    password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
    database: Environment.get("DATABASE_NAME") ?? "vapor_database"
  ), as: .psql)

  let migrations: [AsyncMigration] = [
    CreateAuthorMigration(),
    CreateBookMigration(),
    CreateBookAuthorMigration(),
    CreateUserMigration(),
    CreateUserTokenMigration(),
  ]
  migrations.forEach { migration in
    app.migrations.add(migration)
  }

  try routes(app)
}
