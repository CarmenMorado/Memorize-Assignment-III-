//
//  Memorize__Assignment_III_App.swift
//  Memorize (Assignment III)
//
//  Created by Carmen Morado on 9/15/21.
//

import SwiftUI

@main
struct Memorize__Assignment_III_App: App {
    private let game = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(game: game)
        }
    }
}
