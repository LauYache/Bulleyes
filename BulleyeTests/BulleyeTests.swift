//
//  BulleyeTests.swift
//  BulleyeTests
//
//  Created by Laura Belen Yachelini on 04/05/2023.
//

import XCTest
@testable import Bulleye

final class BulleyeTests: XCTestCase {
  
  var game: Game!
  

  
  override func setUpWithError() throws {
  
    game = Game()
  }
  
  override func tearDownWithError() throws {
    game = nil
  }
  
  func testScorePositive() {
    
    var guess = game.target + 5
    
    var score = game.points(sliderValue: guess)
    
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegative() {
    
    var guess = game.target - 5
    
    var score = game.points(sliderValue: guess)
    
    XCTAssertEqual(score, 95)
  }
  
  func testScoreExact() {
    
    var guess = game.target
    
    var score = game.points(sliderValue: guess)
    
    XCTAssertEqual(score, 200)
  }
  
  func testScoreClose() {
    
    var guess = game.target + 2
    
    var score = game.points(sliderValue: guess)
    
    XCTAssertEqual(score, 98 + 50)
  }
  
  func testStartNewRound() {
    
    game.startNewRound(points: 100)
    
    XCTAssertEqual(game.score, 100)
    XCTAssertEqual(game.round, 2)

  }
  
  
  func testRestart() {
    
    game.startNewRound(points: 100)
    
    XCTAssertNotEqual(game.score, 0)
    XCTAssertNotEqual(game.round, 1)
    game.restart()
    XCTAssertEqual(game.score, 0)
    XCTAssertEqual(game.round, 1)

  }
  
  func testLeaderBoard() {
    
    game.startNewRound(points: 100)
    XCTAssertEqual(game.leaderBoardEntries.count, 1)
    XCTAssertEqual(game.leaderBoardEntries[0].score, 100)
    game.startNewRound(points: 200)
    XCTAssertEqual(game.leaderBoardEntries.count, 2)
    XCTAssertEqual(game.leaderBoardEntries[0].score, 200)
    XCTAssertEqual(game.leaderBoardEntries[1].score, 100)


  }
}
