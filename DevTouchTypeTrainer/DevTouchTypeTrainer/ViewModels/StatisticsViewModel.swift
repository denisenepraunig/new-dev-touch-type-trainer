//
//  StatisticsViewModel.swift
//  DevTouchTypeTrainer
//
//  Created by Denise Nepraunig on 23.04.21.
//

import Foundation

class StatisticsViewModel: ObservableObject {
    @Published var correctKeyPresses: Int = 0
    @Published var mistakeKeyPresses: Int = 0
    @Published var topMistakes: String = ""

    var correctKeyPressesString: String {
        String(correctKeyPresses)
    }

    var mistakeKeyPressesString: String {
        String(mistakeKeyPresses)
    }

    var topMistakesString: String {
        String(topMistakes)
    }

    var result: TypingResult {
        if correctKeyPresses == 0, mistakeKeyPresses == 0 {
            return .neutral
        }

        if mistakeKeyPresses >= correctKeyPresses {
            return .sad
        }

        if correctKeyPresses > 0, mistakeKeyPresses == 0 {
            return .awesome
        }

        if correctKeyPresses > 0, mistakeKeyPresses > 0 {
            return .happy
        }

        return .neutral
    }

    var resultKamoji: String {
        if let kamojis = AppData.kaomoji[self.result] {
            return kamojis[Int.random(in: 0..<kamojis.count)]
        }
        return "┐(￣ヮ￣)┌"
    }
}
