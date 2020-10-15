//
//  GameManager.swift
//  Nombre Mystere
//
//  Created by Julien de Sousa on 07/10/2020.
//

import Foundation
import SwiftUI

class GameManager : ObservableObject {
    @Published var randomNumber:Int = 0
    @Published var isPlaying:Bool = false
    @Published var seconds:Int = 25
    var timer:Timer?
    
    func startGame() {
        self.randomNumber = Int.random(in: 1...1000)
        self.isPlaying = true
    }
    
    func checkProposedNumber(number:String) -> String {
        if let inputFieldValueInt:Int = Int(number) {
            if inputFieldValueInt < self.randomNumber {
                return "C'est +"
            } else if inputFieldValueInt > self.randomNumber {
                return "C'est -"
            } else if inputFieldValueInt == self.randomNumber {
                self.stopTimer()
                return "C'est gagné !"
            } else {
                return "Veuillez saisir un nombre valide"
            }
        } else {
            return "Veuillez saisir un nombre valide"
        }
    }
    
    func colorText(number:String) -> Color {
        if let inputFieldValueInt:Int = Int(number) {
            if (inputFieldValueInt - self.randomNumber > 200) || (inputFieldValueInt - self.randomNumber < -200) {
                return Color.red
            } else if (inputFieldValueInt - self.randomNumber >= 1) || (inputFieldValueInt - self.randomNumber <= -1){
                return Color.orange
            } else {
                return Color.green
            }
        } else {
            return Color.red
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            self.seconds = self.seconds - 1
            if self.seconds == 0 {
                self.stopTimer()
            }
        }
    }
    
    func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
}
