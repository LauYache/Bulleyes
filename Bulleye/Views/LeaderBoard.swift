
import SwiftUI

struct LeaderBoard: View {
  
  @Binding var leaderBoardIsShowing: Bool
  @Binding var game: Game

  var body: some View {
    
    ZStack{
      
      Color("BackgroundColor").ignoresSafeArea()
      
      VStack(spacing: 10) {
        HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
        LabelView()
        ScrollView {
          VStack(spacing: 1) {
            
            ForEach(game.leaderBoardEntries.indices, id: \.self) { index in
              let leaderBoardEntry = game.leaderBoardEntries[index]
              RowView(index: index + 1, score: leaderBoardEntry.score, date: leaderBoardEntry.date)

            }
          }
        }
    }
      
    }
  }
}

struct HeaderView: View {
  
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Binding var leaderBoardIsShowing: Bool

  var body: some View{
    ZStack {
      ZStack {
        BigBoldText(text: "LeaderBoard")
        
        if verticalSizeClass == .regular && horizontalSizeClass == .compact{
          
          Spacer()
        }
      }
      HStack{
        Spacer()
        Button(action: {
          leaderBoardIsShowing = false
        }, label: {
          RoundedImageViewFilled(systemName: "xmark")
            
          
        })
      }
    }.padding([.horizontal, .top])
  }
}

struct LabelView: View {
  
  var body: some View{
    
    HStack{
      
      Spacer()
        .frame(maxWidth: Constants.General.roundedViewLenght)
      Spacer()
      LabelTextView(text: "Score")
        .frame(maxWidth: Constants.LeaderBoard.MaxRowWidth)
      Spacer()
      LabelTextView(text: "Date")
        .frame(maxWidth: Constants.LeaderBoard.MaxRowWidth)
      
    }
    .padding(.horizontal)
    .frame(maxWidth: Constants.LeaderBoard.MaxRowWidth)
  }
}

struct RowView: View {
  
  var index: Int
  var score: Int
  var date: Date
  
  var body: some View {
    HStack{
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.LeaderBoard.scoreColumnWidth)
      Spacer()
      DateText(date: Date())
        .frame(width: Constants.LeaderBoard.dateColumnWidth)
    }
    
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderBoardColor"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.horizontal)
    .frame(maxWidth: Constants.LeaderBoard.MaxRowWidth)
  }
}
//    HStack {
//      RoundedTextView(number: 20)
//      Spacer()
//      ScoreText(number: 20)
//      Spacer()
//      DateText(date: 1230)
//    }
//    .padding(.trailing, 50.0)
//    .frame(width: 692, height: Constants.General.roundedRectViewHeight)
//    .overlay(
//      Capsule()
//        .strokeBorder(Color("ButtomStrokeColor"), lineWidth: Constants.General.strokeWidth))


//struct RoundedTextView: View {
//  
//  var number: Int
//  var body: some View {
//    
//    Text(String(number))
//      .frame(width: Constants.General.roundedRectViewLenght, height: Constants.General.roundedRectViewHeight)
//      .font(.title)
//      .overlay(
//        Circle()
//          .strokeBorder(Color("ButtomStrokeColor"), lineWidth: Constants.General.strokeWidth))
//    
//    
//  }
//}

//struct ScoreText: View {
//
//  var number: Int
//  var body: some View {
//
//    Text(String(number))
//      .frame(width: Constants.General.roundedRectViewLenght, height: Constants.General.roundedRectViewHeight)
//      .font(.title)
//
//  }
//}
//
//struct DateText: View {
//
//  var date: Int
//  var body: some View {
//
//    Text(String(date))
//      .frame(width: Constants.General.roundedRectViewLenght, height: Constants.General.roundedRectViewHeight)
//
//      .font(.title)
//
//  }
//}


struct LeaderBoard_Previews: PreviewProvider {
  
  static var leaderBoardIsShowing = Binding.constant(false)
  static var game = Binding.constant(Game(loadTestData: true))

  static var previews: some View {
    LeaderBoard(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
    LeaderBoard(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
      .previewInterfaceOrientation(.landscapeRight)
      .preferredColorScheme(.dark)
  }
}
