//
//  PaperBot.swift
//  rockpaperscissors
//
//  Created by Mathijs Kadijk on 30-07-15.
//  Copyright © 2015 Mathijs Kadijk. All rights reserved.
//

struct PaperBot: Player {
  static let name = "PaperBot"

  init(opponent: String, myMove: MoveExtractor, theirMove: MoveExtractor) {
    // No-op
  }

  func nextMoveWithPreviousRounds(previousRounds: [Round]) -> Move {
    return .Paper
  }
}
