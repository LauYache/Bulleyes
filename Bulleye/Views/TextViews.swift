//
//  TextViews.swift
//  Bulleye
//
//  Created by Laura Belen Yachelini on 10/05/2023.
//

import SwiftUI

struct InstructionText: View {
  
  var text: String
    var body: some View {
      Text(text.uppercased())
        .foregroundColor(Color("TextColor"))
        .bold()
        .multilineTextAlignment(.center)
        .lineSpacing(4)
        .font(.footnote)
        .kerning(2)
    }
}

struct BigNumberText: View {
  var text: String
  var body: some View {
    
    Text(text)
      .foregroundColor(Color("TextColor"))
      .bold()
      .kerning(-1.0)
      .bold()
      .font(.largeTitle)
      .fontWeight(.black)
    
  }
}

struct SliderValueText: View {
  var text: String
  var body: some View {
    Text(text)
      .bold()
      .font(.subheadline)
  }
}

struct LabelTextView: View {
  var text: String
  var body: some View {
    Text(text.uppercased())
      .kerning(1.5)
      .font(.subheadline)
      .bold()
      .foregroundColor(Color("TextColor"))
  }
}

struct BodyText: View {
  var text: String
  var body: some View {
    Text(text)
      .multilineTextAlignment(.center)
      .frame(maxWidth: .infinity)
      .padding()
      .font(.subheadline)
      .fontWeight(.semibold)
      .lineSpacing(12)
      .foregroundColor(Color("TextColor"))
  }
}

struct ScoreText: View {
  var score: Int
  var body: some View {
    Text(String(score))
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
   //   .frame(maxWidth: Constants.LeaderBoard.scoreColumnWidth)
  }
}

struct DateText: View {
  var date: Date
  
  var body: some View {
    
    Text(date, style: .time)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
      .bold()
     // .frame(maxWidth: Constants.LeaderBoard.dateColumnWidth)
      
  }
}

struct ButtonText: View {
  var text: String
  var body: some View {
    Text(text)
      .frame(maxWidth: .infinity)
      .padding()
      .background(Color.accentColor)
      .font(.title2)
      .bold()
      .foregroundColor(.white)
      .cornerRadius(15)
  }
}

struct NumberTextView: View {
  var number: Int
  var body: some View {
    Text(String(number))
      .bold()
      .font(.title2)
      .kerning(1)
      .foregroundColor(Color("TextColor"))
  }
}

struct BigBoldText: View {
  
  var text: String
  var body: some View {
    
    Text(text.uppercased())
      .kerning(2)
      .foregroundColor(Color("TextColor"))
      .font(.title2)
      .fontWeight(.bold)
    
    
  }
}


struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        InstructionText(text: "Instruction")
        BigNumberText(text: "999")
        LabelTextView(text: "Label")
        NumberTextView(number: 10)
        BodyText(text: "You scored 200 points\n👾👾👾")
        ButtonText(text: "Start New Round")
        ScoreText(score: 459)
        DateText(date: Date())
        BigBoldText(text: "LeaderBoard")
      }
      .padding()
    }
}
