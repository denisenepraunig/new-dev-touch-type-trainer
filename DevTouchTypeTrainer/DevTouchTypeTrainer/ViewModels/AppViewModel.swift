//
//  ViewModel.swift
//  DevTouchTypeTrainer
//
//  Created by Denise Nepraunig on 23.04.21.
//

import Foundation
import SwiftUI

enum Page {
    case training
    case statistics
}

class AppViewModel: ObservableObject {
    @Published var page: Page = .training
    @Published var statistics = StatisticsViewModel()
    @Published var isActive = true

    func resetStatistics() {
        statistics = StatisticsViewModel()
    }
}
