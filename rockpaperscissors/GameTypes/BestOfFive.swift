//
//  BestOfFive.swift
//  rockpaperscissors
//
//  Created by Mathijs Kadijk on 30-07-15.
//  Copyright © 2015 Mathijs Kadijk. All rights reserved.
//

struct BestOfFive: GameType {
  static let name = "Best of Five"

  func gameProgress(rounds: [Round]) -> GameProgress {
    guard rounds.count >= 5 else { return .Unfinished }

    let wins = rounds.reduce((leftWins: 0, rightWins: 0)) { wins, round in
      switch round.leftMove.beats(round.rightMove) {
      case .Win:
        return (leftWins: wins.leftWins + 1, rightWins: wins.rightWins)
      case .Lose:
        return (leftWins: wins.leftWins, rightWins: wins.rightWins + 1)
      case .Tie:
        return wins
      }
    }

    if wins.leftWins > wins.rightWins {
      return .Finished(.LeftWins)
    } else if wins.leftWins < wins.rightWins {
      return .Finished(.RightWins)
    } else {
      return .Finished(.Tie)
    }
  }
}
