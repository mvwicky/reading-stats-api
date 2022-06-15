//
//  UserToken.swift
//
//
//  Created by Michael Van Wickle on 6/11/22.
//

import Fluent
import Vapor

final class UserToken: Model, Content {
  static let schema = "user_tokens"

  @ID(key: .id)
  var id: UUID?

  @Field(key: "value")
  var value: String

  @Parent(key: "user_id")
  var user: User

  init() {}

  init(_ id: UUID? = nil, value: String, userId: User.IDValue) {
    self.id = id
    self.value = value
    $user.id = userId
  }
}
