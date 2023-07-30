//
//  RoundedViews.swift
//  Bulleye
//
//  Created by Laura Belen Yachelini on 12/05/2023.
//

import SwiftUI


struct RoundedImageViewFilled: View {
  
  var systemName: String
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .frame(width: Constants.General.roundedViewLenght, height: Constants.General.roundedViewLenght)
      .foregroundColor(Color("ButtomFilledTextColor"))
    //      .background(
    //        Circle()
    //          .fill(Color("ButtomFilledBackgroundColor"))
    //      )
      .background(Color("ButtomFilledBackgroundColor"))
      .clipShape(Circle())
  }
}

struct RoundedImageViewStroked: View {
  
  var systemName: String
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedRectViewLenght, height: Constants.General.roundedRectViewHeight)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtomStrokeColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}


struct RoundedRectTextView: View  {
  
  var text: String
  var number: Int
  var body: some View {
    
    VStack {
      Text(text)
      Text(String(number))
        .frame(width: Constants.General.roundedRectViewLenght, height: Constants.General.roundedRectViewHeight)
        .bold()
        .font(.title)
        .overlay(
          Capsule()
            .strokeBorder(Color("ButtomStrokeColor"), lineWidth: Constants.General.strokeWidth)
        )
    }
  }
  
}

struct RoundedTextView: View  {
  
  var text: String
  var body: some View {
    
//    VStack {
      Text(text)
      .frame(width: Constants.General.roundedRectViewLenght, height: Constants.General.roundedRectViewLenght)
        .font(.title3)
        .bold()
        .overlay(
          Circle()
            .strokeBorder(Color("LeaderBoardColor"), lineWidth: Constants.General.strokeWidth))
//    }
  }
  
}
struct PreviewView: View {
  
  var body: some View {
    VStack(spacing: 10){
      
      
      RoundedImageViewFilled(systemName: "arrow.counterclockwise")
      RoundedImageViewStroked(systemName: "list.dash")
      RoundedRectTextView(text: "Label", number: 20)
      RoundedTextView(text: "1")
      
      
    }
  }
  
}
struct RoundedViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    PreviewView()
      .preferredColorScheme(.dark)
    
  }
}
