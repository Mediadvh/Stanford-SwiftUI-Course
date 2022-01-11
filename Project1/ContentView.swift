//
//  ContentView.swift
//  Project1
//
//  Created by Media Davarkhah on 10/20/1400 AP.
//

import SwiftUI

struct ContentView: View {
  
    var emojis = ["❤️‍🔥","😂","🧸","😤","😆","💄","🦾","🍎","🦠","🩹","🧯","🛢","💎","🛡","🪆","📥","✂️","🖤","🚎","🪕"]
    @State var emojisCount = 19
    var body: some View {
        VStack {
            Text("Memorize!")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojisCount], id: \.self) { emoji in
                        CardView(isFaceUp: false, content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .font(.largeTitle)
        
        
    }
        
    
    // view properties
    var add: some View {
        return Button {
            if emojisCount != emojis.count - 1 {
                emojisCount += 1
            }
        } label: {
            let image = Image(systemName: "plus.circle.fill")
            if emojisCount == emojis.count - 1 {
               image
               .foregroundColor(.gray)
            } else {
                image
            }
        }
    }
    var remove: some View {
        return Button {
            if emojisCount > 1{
                emojisCount -= 1
            }
        } label: {
        let image = Image(systemName: "minus.circle.fill")
            if emojisCount == 1{
                image
                    .foregroundColor(.gray)
            } else {
                image
            }
            
        }
    }
        
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    @State var content: String
    
    var body: some View {
        ZStack {
            let shape =  RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill()
                    .font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 5)
                Text(content)
                
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
