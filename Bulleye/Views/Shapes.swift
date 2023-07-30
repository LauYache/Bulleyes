//
//  Shapes.swift
//  Bulleye
//
//  Created by Laura Belen Yachelini on 12/05/2023.
//

import SwiftUI

struct Shapes: View {
  
  @State private var wideShapes = true
  var body: some View {
    VStack{
      
      if !wideShapes{
        Circle()
          .strokeBorder(Color.blue, lineWidth: 5)
          .frame(width: 200, height: 100)
          .background(Color.green)
          .transition(.scale)
      }
      RoundedRectangle(cornerRadius: 20)
        .fill(Color.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
      //      .animation(.easeInOut, value: wideShapes)
      Capsule()
        .frame(width: wideShapes ? 200 : 100, height: 100)
      Ellipse()
        .frame(width: wideShapes ? 200 : 100, height: 100)
      
      Button("Animate") {
        
        withAnimation {
          wideShapes.toggle()
        }
      }
    }
    
    
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
