//
//  TrainingView.swift
//  DevTouchTypeTrainer
//
//  Created by Denise Nepraunig on 23.04.21.
//

import SwiftUI

struct TrainingView: View {
    @EnvironmentObject var appVM: AppViewModel
    @StateObject var vm: TrainingViewModel
    @State private var keyPressed = "x"

    let keySize: CGFloat = 75

    var body: some View {
        VStack {
            Group {
                keyView
                keyHintView
            }
            .padding(.smallPadding)

            keyPressedView
                .opacity(vm.opacityKeyPressed)

            endTrainingView
                .padding(.bigPadding)
        }
        .foregroundColor(vm.foregroundColor)
        .background(KeyEventHandling(pressedKey: $keyPressed))
        .frame(minWidth: AppData.viewSize, minHeight: AppData.viewSize)
        .onAppear {
            vm.updateAppVM(appVM: appVM)
            vm.shuffleKeys()
        }
        .onChange(of: keyPressed, perform: { value in
            vm.compareKey(pressedKey: keyPressed)
        })
    }

    private var keyView: some View {
        Text(vm.key)
            .font(.system(size: keySize))
            .foregroundColor(vm.keyColor)
    }

    private var keyHintView: some View {
        Text(vm.keyHint)
    }

    private var keyPressedView: some View {
        Text(keyPressed.prefix(1))
            .font(.title)
            .foregroundColor(Color(.labelColor))
    }

    private var endTrainingView: some View {
        Button("End Training") {
            vm.endTraining()
        }
    }
}



struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView(vm: TrainingViewModel())
            .preferredColorScheme(.dark)
            .environmentObject(AppViewModel())
    }
}
