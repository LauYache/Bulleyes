

import Foundation

struct Game {
  
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderBoardEntries: [Leaderboard] = []
  
  init (loadTestData:Bool = false){
    
    if loadTestData{
      addToLeaderBoard(score: 100)
      addToLeaderBoard(score: 80)
      addToLeaderBoard(score: 68)
      addToLeaderBoard(score: 88)
    }
  }
  
  mutating func points (sliderValue: Int) -> Int {
    
    let difference = abs(target - sliderValue)
    let bonus: Int
    
    if difference == 0{
      
      bonus = 100
    } else if difference <= 2 {
      
      bonus = 50
    } else {
      bonus = 0
    }
    return 100 - difference + bonus
    
    /*var points = 100 - abs(target - sliderValue)
     if points == 100 {
     points += 200
     }
     if points == 98 || points == 99 {
     points += 50
     }
     return points
     */
    
  }
  
  mutating func startNewRound (points: Int) {
    addToLeaderBoard(score: points)
    score = score + points
    round += 1
    target = Int.random(in: 1...100)
  

  }
  
  mutating func addToLeaderBoard(score: Int){
    
    leaderBoardEntries.append(Leaderboard(score: score, date: Date()))
    leaderBoardEntries.sort { entry1, entry2 in
       
      entry1.score > entry2.score
    }
  }
  
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 1...100)

  }
}

struct Leaderboard {
  var score: Int
  var date: Date
}
