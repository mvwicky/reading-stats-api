import Fluent
import Vapor

/// The Book/Author Pivot Model (because books can have more than one author).
final class BookAuthor: Model {
  static let schema = "book+author"

  @ID(key: .id)
  var id: UUID?

  @Parent(key: "book_id")
  var book: Book

  @Parent(key: "author_id")
  var author: Author

  init() {}

  init(id: UUID? = nil, book: Book, author: Author) throws {
    self.id = id
    self.$book.id = try book.requireID()
    self.$author.id = try author.requireID()
  }

  init(id: UUID? = nil, bookId: Book.IDValue, authorId: Author.IDValue) {
    self.id = id
    $book.id = bookId
    $author.id = authorId
  }
}
