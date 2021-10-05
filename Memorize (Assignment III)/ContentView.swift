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
        VStack{}
            .padding(50)

        AspectVGrid(items: game.cardsToShow, aspectRatio: 2/3) { card in
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.chose(card: card)
                    }
            }
            .padding(.horizontal)
        
        VStack {
            HStack {
                ShowHintButton(viewModel: game)
                Spacer()
                NewGameButton {
                    withAnimation {
                        self.game.newGame()
                    }
                }
                .padding()
                
                DealMoreButton(viewModel: game)
            }
        }
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
                .bold()
                .frame(width: 150, height: 50)
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color(.systemTeal), Color(.systemPurple)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                .clipShape(Capsule())
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
                .bold()
                .frame(width: 150, height: 50)
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color(.systemTeal), Color(.systemPurple)]), startPoint: .trailing, endPoint: .leading))
                .clipShape(Capsule())
        })
            .padding()
            .alert(isPresented: $isAlertVisible) {
                Alert(
                    title: Text("No sets available"),
                    message: Text("Do you want to deal more cards"),
                    primaryButton: .default(Text("Yes")) {
                        withAnimation { self.viewModel.dealThreeMoreCards()
                            
                        }
                    },
                    secondaryButton: .cancel()
            )
        }
    }
}

struct DealMoreButton: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        Button(action: {
                withAnimation {
                    self.viewModel.dealThreeMoreCards()
                }
            }, label: {
            Text("Hint")
                .bold()
                .frame(width: 150, height: 50)
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color(.systemTeal), Color(.systemPurple)]), startPoint: .trailing, endPoint: .leading))
                .clipShape(Capsule())
        })
        .padding()
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = ViewModel()
        return ContentView(game: game)
    }
}
