//
//  ContentView.swift
//  Project1
//
//  Created by Media Davarkhah on 10/20/1400 AP.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["❤️‍🔥","😂","🧸","😤","😆","💄","🦾","🍎","🦠","🩹","🧯","🛢"]
    
    
    @State var emojisCount = 12
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
                faceTheme
                Spacer()
                carTheme
                Spacer()
                appleTheme
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
            if emojisCount != emojis.count {
                emojisCount += 1
            }
        } label: {
            let image = Image(systemName: "plus.circle.fill")
            if emojisCount == emojis.count  {
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
    var faceTheme: some View {
        return VStack {
            Button {
                emojis = ["😅","😀","😁","😂","😊","😖","🥶","😵","😵‍💫","🥳"]
                emojisCount = emojis.count
                emojis.shuffle()
            } label: {
                Image(systemName: "face.smiling.fill")
            }
            Text("face theme")
                .font(.caption)
        }
        
    }
    var carTheme: some View {
        return VStack {
            Button {
                emojis = ["🚗","🚙","🏎","🚕","🚓","🚘","🚖","🚔","🚋","🚃","🚠"]
                emojisCount = emojis.count
                emojis.shuffle()
            } label: {
                Image(systemName: "car.fill")
            }
            Text("car theme")
                .font(.caption)
                
        }
    }
    var appleTheme: some View {
        return VStack {
            Button {
                emojis = ["🍎","📱","⌚️","🖥","💻","⌨️","🎧","📲","👩🏻‍💻","🧑🏽‍💻","👨🏿‍💻","🍏"]
                emojisCount = emojis.count
                emojis.shuffle()
            } label: {
                Image(systemName: "applelogo")
            }
            Text("apple theme")
                .font(.caption)
            
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
