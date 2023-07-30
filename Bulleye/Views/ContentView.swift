

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()
  
  var body: some View {
    ZStack {
      Background(game: $game)
      
      VStack {
        InstructionView(game: $game)
          .padding(.bottom, alertIsVisible ? 0 : 100)
      
      
      if alertIsVisible {
        
        PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
          .transition(.scale)
      } else {
        HitMeButtom(alertIsVisible: $alertIsVisible, text: "Hit me", sliderValue: $sliderValue, game: $game)
          .zIndex(1)
          .transition(.scale)
      }
    }
    
      if !alertIsVisible {
        SliderView(sliderValue: $sliderValue)
          .transition(.scale)
      }
    }
  }
}

struct InstructionView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      InstructionText(text: "Put the BullSEye as close as you can to 🎯🎯🎯")
        .padding([.horizontal, .top])
      BigNumberText(text:String(game.target))
        .padding()
      
    }
  }
}
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .preferredColorScheme(.dark)
      .previewInterfaceOrientation(.landscapeRight)
    
    
  }
}
struct SliderView: View {
  @Binding var sliderValue: Double
  var body: some View {
    HStack{
      SliderValueText(text:"1")
        .frame(width: 35)
      Slider(value: $sliderValue, in: 1.0...100)
      SliderValueText(text: "100")
        .frame(width: 35)
    }
   .padding()
  }
}

struct HitMeButtom: View {
  @Binding var alertIsVisible: Bool
  var text: String
  @Binding var sliderValue: Double
  @Binding var game: Game
  var body: some View {
    Button(text.uppercased()) {
      withAnimation{
        alertIsVisible = true
      }
    }
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtomColor")
        LinearGradient(colors: [Color.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
      }
    )
    .overlay(
      RoundedRectangle(cornerRadius: Constants.General.roundedCornerRadius)
        .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
    )
    .foregroundColor(.white)
    .cornerRadius(Constants.General.roundedCornerRadius)
    .bold()
    .font(.title3)
    
  }
}

