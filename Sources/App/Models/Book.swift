import Fluent
import Vapor

final class Book: Model, Content {
  static let schema = "books"

  @ID(key: .id)
  var id: UUID?

  @Field(key: "title")
  var title: String

  @Field(key: "pub_year")
  var pubYear: Int

  @OptionalField(key: "total_pages")
  var totalPages: Int?

  @OptionalField(key: "max_location")
  var maxLocation: Int?

  @Field(key: "pages_read")
  var pagesRead: Int

  @Field(key: "location")
  var location: Int

  @OptionalField(key: "started")
  var started: Date?

  @OptionalField(key: "finished")
  var finished: Date?

  @Field(key: "off")
  var off: Int

  @Timestamp(key: "created", on: .create)
  var created: Date?

  @Timestamp(key: "modified", on: .update)
  var modified: Date?

  @Parent(key: "author_id")
  var author: Author

  @Parent(key: "creator_id")
  var creator: User

  @Siblings(through: BookAuthor.self, from: \.$book, to: \.$author)
  public var authors: [Author]

  init() {}

  init(_ id: UUID? = nil, title: String, pubYear: Int, totalPages: Int) {
    self.id = id
    self.title = title
    self.pubYear = pubYear
    self.totalPages = totalPages
    pagesRead = 0
    location = 0
    off = 0
  }

  init(_ id: UUID? = nil, title: String, pubYear: Int, maxLocation: Int) {
    self.id = id
    self.title = title
    self.pubYear = pubYear
    self.maxLocation = maxLocation
    pagesRead = 0
    location = 0
    off = 0
  }
}
