//
//  StatisticsView.swift
//  DevTouchTypeTrainer
//
//  Created by Denise Nepraunig on 23.04.21.
//

import SwiftUI

struct StatisticsView: View {
    @EnvironmentObject var appVM: AppViewModel
    @State private var resultKamoji = ""
    
    private var foregroundColor: Color {
        appVM.isActive ? Color(.labelColor) : Color(.tertiaryLabelColor)
    }
    
    var body: some View {
        VStack {
            statisticsEmoji
                .padding(.bigPadding)

            keyStatisticsView
                .padding(.smallPadding)
            
            if appVM.statistics.mistakeKeyPresses != 0 {
                mistakesView
                    .padding(.bigPadding)
            }
            
            Button("Restart") {
                appVM.page = .training
                appVM.resetStatistics()
            }
            .padding(.bigPadding)
        }
        .foregroundColor(foregroundColor)
        .frame(width: AppData.viewSize, height: AppData.viewSize)
        .onAppear {
            resultKamoji = appVM.statistics.resultKamoji
        }
    }

    private var statisticsEmoji: some View {
        Text(resultKamoji)
            .font(.largeTitle)
            .foregroundColor(.purple)
    }
    
    private var keyStatisticsView: some View {
        VStack {
            Text("Correct keys: \(appVM.statistics.correctKeyPressesString)")
            Text("Mistakes: \(appVM.statistics.mistakeKeyPressesString)")
        }
    }
    
    private var mistakesView: some View {
        VStack {
            Text("Top mistakes:")
            Text(appVM.statistics.topMistakesString)
                .font(.largeTitle)
                .tracking(5)
                .foregroundColor(.purple)
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
            .environmentObject(AppViewModel())
            .preferredColorScheme(.dark)
    }
}
