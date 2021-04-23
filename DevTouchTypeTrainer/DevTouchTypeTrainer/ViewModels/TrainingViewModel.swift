//
//  TrainingViewModel.swift
//  DevTouchTypeTrainer
//
//  Created by Denise Nepraunig on 23.04.21.
//

import Foundation
import SwiftUI

class TrainingViewModel: ObservableObject {
    @Published var index = 0
    @Published var keys = Array(AppData.keyHints.keys)
    @Published var opacityKeyPressed: Double = 0.0

    var correctKeyPresses = 0
    var mistakeKeyPresses = 0
    var mistakes: [String: Int] = ["": 0]

    @Published var appVM: AppViewModel

    var foregroundColor: Color {
        appVM.isActive ? Color(.labelColor) : Color(.tertiaryLabelColor)
    }

    var keyColor: Color {
        appVM.isActive ? .purple : Color(.tertiaryLabelColor)
    }

    var keyHint: String {
        String(AppData.keyHints[keys[index]] ?? "")
    }

    var key: String {
        String(keys[index])
    }

    init(appVM: AppViewModel? = nil) {
        if let appVM = appVM {
            self.appVM = appVM
        } else {
            self.appVM = AppViewModel()
        }
    }

    func updateAppVM(appVM: AppViewModel) {
        self.appVM = appVM
    }

    func shuffleKeys() {
        index = 0
        keys.shuffle()
    }

    func endTraining() {
        updateStatistics()
        navigateToStatistics()
    }

    func navigateToStatistics() {
        appVM.page = .statistics
    }

    func updateStatistics() {
        appVM.statistics.correctKeyPresses = correctKeyPresses
        appVM.statistics.mistakeKeyPresses = mistakeKeyPresses

        let top5Mistakes = mistakes
            .sorted { $0.value > $1.value }
            .filter { $0.value > 0 }
            .map { String($0.key) }
            .prefix(5)
            .joined(separator: " ")

        appVM.statistics.topMistakes = top5Mistakes
    }

    func compareKey(pressedKey: String) {
        if pressedKey.prefix(1) == String(keys[index]) {
            correctKeyPresses += 1
            nextKey()
        } else {
            increaseMistakes()
            animateMistake()
        }
    }

    private func animateMistake() {
        withAnimation(.easeInOut(duration: 0.4), {
            opacityKeyPressed = 0.8
        })

        withAnimation(.easeInOut(duration: 0.5), {
            opacityKeyPressed = 0
        })
    }

    private func increaseMistakes() {
        mistakeKeyPresses += 1

        if var value = mistakes[String(keys[index])] {
            value = value + 1
            mistakes[String(keys[index])] = value
        } else {
            mistakes[String(keys[index])] = 1
        }
    }

    func nextKey() {
        if index == (keys.count - 1) {
            keys.shuffle()
            index = 0
        } else {
            index = index + 1
        }
    }
}
