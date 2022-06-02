import Fluent
import Vapor

struct BookController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let todos = routes.grouped("books")
        todos.get(use: index)
        todos.post(use: create)
        todos.group(":bookID") { book in
            book.delete(use: delete)
        }
    }

    func index(req: Request) async throws -> [Book] {
        try await Book.query(on: req.db).all()
    }

    func create(req: Request) async throws -> Book {
        let book = try req.content.decode(Book.self)
        try await book.save(on: req.db)
        return book 
    }

    func delete(req: Request) async throws -> HTTPStatus {
        guard let book = try await Book.find(req.parameters.get("bookID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await book.delete(on: req.db)
        return .ok
    }
}
