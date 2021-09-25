//
//  ContentView.swift
//  Memorize (Assignment III)
//
//  Created by Carmen Morado on 9/19/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game: ViewModel
    
    var body: some View {
        VStack {
                    HStack {
                        ShowHintButton(viewModel: game)
                        Spacer()
                        NewGameButton {
                            withAnimation {
                                self.game.newGame()
                            }
                        }
                    }
        }
        AspectVGrid(items: game.cardsToShow, aspectRatio: 2/3) { card in
         //   if card.isMatched && !card.isFaceUp {
         //       Rectangle().opacity(0)
        //    }
            
        //    else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.chose(card: card)
                }
       //     }
        }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
    }
}

struct NewGameButton: View {
    @State var isDialogPresented: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: {
            self.isDialogPresented = true
        }, label: {
            Text("New game")
        })
            .padding()
            .alert(isPresented: $isDialogPresented) {
                Alert(
                    title: Text("Start new game"),
                    primaryButton: .default(Text("Yes"), action: action ),
                    secondaryButton: .cancel()
                )
        }
    }
}
    
struct ShowHintButton: View {
    @ObservedObject var viewModel: ViewModel
    @State var isAlertVisible: Bool = false

    var body: some View {
        Button(action: {
            withAnimation {
                self.isAlertVisible = !self.viewModel.showHint()
            }
        }, label: {
            Text("Hint")
        })
            .padding()
            .alert(isPresented: $isAlertVisible) {
                Alert(
                    title: Text("No sets available"),
                    message: Text("Do you want to deal more cards"),
                    primaryButton: .default(Text("Yes")) {
                        withAnimation { //self.viewModel.dealMore()
                            
                        }
                    },
                    secondaryButton: .cancel()
                )
        }
    }
}


//struct CardView: View {
//   let card: Card
    
//    var body: some View {
//        GeometryReader(content: {geometry in
//            ZStack {
//                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
//                    shape.fill().foregroundColor(.white)
//                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
//                        .padding(5).opacity(0.5)
//                    Text(card.content).font(font(in: geometry.size))
                    
                
                //else if card.isMatched {
                 //   shape.opacity(0)
                //}
                
               // else {
               //     shape.fill()
               // }
//            }
//        })
 //   }
    
//    private func font(in size: CGSize) -> Font {
//        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
//    }
    
//    private struct DrawingConstants {
//        static let cornerRadius: CGFloat = 10
//        static let lineWidth: CGFloat = 3
//        static let fontScale: CGFloat = 0.7
//    }
//}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = ViewModel()
        //game.choose(game.cards.first!)
        return ContentView(game: game)
    }
}
