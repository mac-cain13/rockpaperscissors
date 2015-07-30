//
//  RandomBot.swift
//  rockpaperscissors
//
//  Created by Mathijs Kadijk on 30-07-15.
//  Copyright © 2015 Mathijs Kadijk. All rights reserved.
//

import Foundation

struct RandomBot: Player {
  static let name = "RandomBot"

  init(opponent: String, myMove: MoveExtractor, theirMove: MoveExtractor) {
    // No-op
  }

  func nextMoveWithPreviousRounds(previousRounds: [Round]) -> Move {
    switch arc4random_uniform(3) {
    case 0:
      return .Rock
    case 1:
      return .Paper
    default:
      return .Scissor
    }
  }
}
