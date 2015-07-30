//
//  Types.swift
//  rockpaperscissors
//
//  Created by Mathijs Kadijk on 30-07-15.
//  Copyright © 2015 Mathijs Kadijk. All rights reserved.
//

enum Move {
  case Rock
  case Paper
  case Scissor

  func beats(counterMove: Move) -> BeatResult {
    switch (self, counterMove) {
    case (.Rock, .Scissor), (.Paper, .Rock), (.Scissor, .Paper):
      return .Win
    case (.Rock, .Rock), (.Paper, .Paper), (.Scissor, .Scissor):
      return .Tie
    default:
      return .Lose
    }
  }

  enum BeatResult {
    case Win
    case Tie
    case Lose
  }
}

enum GameProgress {
  case Unfinished
  case Finished(Winner)
}

enum Winner {
  case LeftWins
  case RightWins
  case Tie
}

typealias MoveExtractor = Round -> Move
typealias Players = (left: Player, right: Player)
typealias Round = (leftMove: Move, rightMove: Move)

protocol GameType {
  static var name: String { get }

  func gameProgress(rounds: [Round]) -> GameProgress
}

protocol Player {
  static var name: String { get }

  init(opponent: String, myMove: MoveExtractor, theirMove: MoveExtractor)

  func nextMoveWithPreviousRounds(previousRounds: [Round]) -> Move
}

func preparePlayers(leftPlayerType leftPlayerType: Player.Type, rightPlayerType: Player.Type) -> Players {
  let leftPlayer = leftPlayerType.init(opponent: rightPlayerType.name, myMove: { $0.leftMove }, theirMove: { $0.rightMove })
  let rightPlayer = rightPlayerType.init(opponent: leftPlayerType.name, myMove: { $0.rightMove }, theirMove: { $0.leftMove })
  return (leftPlayer, rightPlayer)
}
