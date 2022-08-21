import Fluent
import Vapor

final class BookReadthrough: Model {
  static let schema = "book_readthrough"

  @ID(key: .id)
  var id: UUID?

  @OptionalField(key: "started")
  var started: Date?

  @OptionalField(key: "finished")
  var finished: Date?

  @Field(key: "off")
  var off: Int

  @Field(key: "pages_read")
  var pagesRead: Int

  @Field(key: "location")
  var location: Int

  @Parent(key: "book_id")
  var book: Book

  @Parent(key: "user_id")
  var user: User

  init() {}
}
