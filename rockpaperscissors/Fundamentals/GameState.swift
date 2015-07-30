//
//  GameState.swift
//  rockpaperscissors
//
//  Created by Mathijs Kadijk on 30-07-15.
//  Copyright © 2015 Mathijs Kadijk. All rights reserved.
//

struct GameState {
  let gameType: GameType
  let players: Players
  let rounds: [Round]

  init(players: Players, gameType: GameType) {
    self.players = players
    self.rounds = []
    self.gameType = gameType
  }

  private init(players: Players, rounds: [Round], gameType: GameType) {
    self.players = players
    self.rounds = rounds
    self.gameType = gameType
  }

  func gameProgress() -> GameProgress {
    return gameType.gameProgress(rounds)
  }

  func winner() -> Winner? {
    switch gameProgress() {
    case let .Finished(gameResult):
      return gameResult
    case .Unfinished:
      return nil
    }
  }

  func playNextRound() -> GameState {
    return play(shouldRecurse: false)
  }

  func playUntilFinished() -> GameState {
    return play(shouldRecurse: true)
  }

  private func play(shouldRecurse shouldRecurse: Bool) -> GameState {
    switch gameProgress() {
    case .Finished:
      return self
    case .Unfinished:
      let nextRound = (players.left.nextMoveWithPreviousRounds(rounds), players.right.nextMoveWithPreviousRounds(rounds))
      let nextGameState = GameState(players: players, rounds: rounds + [nextRound], gameType: gameType)
      return shouldRecurse ? nextGameState.play(shouldRecurse: shouldRecurse) : nextGameState
    }
  }
}
