//
//  startView.swift
//  Nombre Mystere
//
//  Created by Julien de Sousa on 01/10/2020.
//

import SwiftUI

struct StartView: View {
    var currentGame:GameManager
    var body: some View {
        VStack {
            Text("Nombre Mystère")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.blue)
            Button("JOUER", action: currentGame.startGame)
                .padding()
        }.padding()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
