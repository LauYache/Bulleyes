
/*
.alert(
  "Hello there",
  isPresented: $alertIsVisible,
  actions: {
    Button("Awesome") {
      game.startNewRound(points: game.points(sliderValue: Int(sliderValue)))
    }
  },
  message: {
    var roundedValue: Int = (Int(sliderValue.rounded()))
    var textCongrats = Text("""
                          The slider value is \(roundedValue).
                          You scored \(game.points(sliderValue: roundedValue)) points in this round
                      """)
      .foregroundColor(Color("TextColor"))
    if roundedValue == game.target{
      
      Text("""
        \(textCongrats).
        Congrats, you have earned 200 bonus points.
        """)
      
    }else if roundedValue == game.target - 1 || roundedValue == game.target - 2{
      
      Text("""
        \(textCongrats).
        Congrats, you have earned 50 bonus points.
        """)
    }else{
      textCongrats
    }

  }
)
*/
