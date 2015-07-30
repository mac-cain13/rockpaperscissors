//
//  main.swift
//  rockpaperscissors
//
//  Created by Mathijs Kadijk on 28-07-15.
//  Copyright (c) 2015 Mathijs Kadijk. All rights reserved.
//

import Foundation

let players = preparePlayers(leftPlayerType: RockBot.self, rightPlayerType: RandomBot.self)
let gameState = GameState(players: players, gameType: BestOfFive())

print("\(gameState.gameType.dynamicType.name)")
print("\(gameState.players.left.dynamicType.name) vs \(gameState.players.right.dynamicType.name)")

if let winner = gameState.playUntilFinished().winner() {
  switch winner {
  case .LeftWins: print("\(gameState.players.left.dynamicType.name) wins!")
  case .RightWins: print("\(gameState.players.right.dynamicType.name) wins!")
  case .Tie: print("It's a tie!")
  }
}

