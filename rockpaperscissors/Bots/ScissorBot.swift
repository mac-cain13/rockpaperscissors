//
//  ScissorBot.swift
//  rockpaperscissors
//
//  Created by Mathijs Kadijk on 30-07-15.
//  Copyright © 2015 Mathijs Kadijk. All rights reserved.
//

struct ScissorBot: Player {
  static let name = "ScissorBot"

  init(opponent: String, myMove: MoveExtractor, theirMove: MoveExtractor) {
    // No-op
  }

  func nextMoveWithPreviousRounds(previousRounds: [Round]) -> Move {
    return .Scissor
  }
}
