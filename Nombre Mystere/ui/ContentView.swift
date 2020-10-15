//
//  ContentView.swift
//  Nombre Mystere
//
//  Created by Julien de Sousa on 07/10/2020.
//

import SwiftUI

struct ContentView: View {
    @StateObject var currentGame = GameManager()
    var body: some View {
        if currentGame.isPlaying {
            ProposedNumberView(currentGame: currentGame)
        } else {
            StartView(currentGame: currentGame)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
