

import SwiftUI

struct Background: View {
  @Binding var game: Game
  var body: some View {
    VStack{
      topView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(
      RingsView()
    )
  }
}

struct topView: View {
  @Binding var game: Game
  @State var leaderBoardIsShowing = false
  
  
  var body: some View {
    HStack(){
      Button(
        action: {
          game.restart()
        },
        label: {
          RoundedImageViewStroked(systemName: "arrow.counterclockwise")
        }
      )
      Spacer()
      Button{
        leaderBoardIsShowing = true
      }
    label: {
      RoundedImageViewFilled(systemName: "list.dash")
    }
    .sheet(isPresented: $leaderBoardIsShowing) {
      LeaderBoard(leaderBoardIsShowing: $leaderBoardIsShowing, game: $game)

    }
    }
  }
}

struct numberView: View {
  var title: String
  var number: Int
  
  var body: some View {
    RoundedRectTextView(text: title, number: (number))
  }
}

struct BottomView: View {
  @Binding var game: Game
  
  var body: some View {
    HStack(){
      numberView(title: "Score", number: game.score)
      Spacer()
      numberView(title: "Round", number: game.round)
    }
  }
}

struct RingsView: View{
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View{
    ZStack{
      
      ForEach(1..<6) { ring in
        let size = CGFloat(ring * 100)
        let opacity = colorScheme == .dark ? 0.1 : 0.3
        Circle()
          .stroke(lineWidth: 20)
          .fill(
            RadialGradient(gradient: Gradient(colors: [Color("CircleBackgroundColor").opacity(opacity * 0.8), Color("CircleBackgroundColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300))
          .frame(width: size, height: size)
      }
    }
  }
}

struct Background_Previews: PreviewProvider {
  static var previews: some View {
    Background(game: .constant(Game()))
  }
}
