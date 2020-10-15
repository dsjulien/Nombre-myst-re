//
//  GameStartedView.swift
//  Nombre Mystere
//
//  Created by Julien de Sousa on 01/10/2020.
//

import SwiftUI

struct ProposedNumberView: View {
    @State var inputFieldValue:String = ""
    @State private var textReturnCheckNumber:String = ""
    @State private var colorReturnText:Color = Color.black
    @State private var firstPropose:Bool = true
    @StateObject var currentGame:GameManager
    var body: some View {
        VStack {
            Text("Temps restant")
            Text(String(currentGame.seconds))
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
            Text("Proposez un nombre entre 1 et 1000")
            TextField("Nombre", text: $inputFieldValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            if currentGame.seconds != 0 {
                Button("Valider"){
                    textReturnCheckNumber = currentGame.checkProposedNumber(number: inputFieldValue)
                    colorReturnText = currentGame.colorText(number: inputFieldValue)
                    if firstPropose {
                        currentGame.startTimer()
                        firstPropose = false
                    }
                }
                .padding()
            }
            
            Spacer()
            if currentGame.seconds == 0 {
                Text("Vous avez perdu")
                    .font(.headline)
                    .foregroundColor(Color.red)
                    .bold()
            } else {
                Text(textReturnCheckNumber)
                    .font(.headline)
                    .foregroundColor(colorReturnText)
                    .bold()
            }
        }
        .padding()
    }
}


struct ProposedNumberView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
            .font(.title)
            .foregroundColor(Color.green)
            .bold()
    }
}
