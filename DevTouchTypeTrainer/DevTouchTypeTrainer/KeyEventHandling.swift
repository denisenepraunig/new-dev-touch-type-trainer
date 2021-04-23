//
//  KeyEventHandling.swift
//  DevTouchTypeTrainer
//
//  Created by Denise Nepraunig on 23.04.21.
//

import Foundation
import SwiftUI

// example is from: https://stackoverflow.com/questions/61153562/how-to-detect-keyboard-events-in-swiftui-on-macos
struct KeyEventHandling: NSViewRepresentable {
    @Binding var pressedKey: String

    class KeyView: NSView {
        @Binding private var pressedKey: String

        init(frame frameRect: NSRect, pressedKey: Binding<String>) {
            self._pressedKey = pressedKey
            super.init(frame: frameRect)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        override var acceptsFirstResponder: Bool { true }
        override func keyDown(with event: NSEvent) {
            // super causes the beep sound!!!
            // super.keyDown(with: event)

            // ignore ENTER 36 and BACKSPACE 51
            // TODO: maybe there is a better way than keyCodes
            guard event.keyCode != 36 || event.keyCode != 51 else {
                return
            }

            // TODO: check other keys
            // Arrow keys are 123, 124, 125 and 126
            /*
             type=KeyDown loc=(225.444,220.392) time=576191.5 flags=0xa00100 win=0x7f7f8c806f60 winNum=39506 ctxt=0x0 chars="" unmodchars="" repeat=0 keyCode=125
             */

            // a unique ID is added to the keypress
            // otherwise if the same key is pressed twice
            // the onChange in the view doesn't react
            pressedKey = "\(event.charactersIgnoringModifiers ?? "")-\(UUID())"
        }
    }

    func makeNSView(context: Context) -> NSView {
        let view = KeyView(frame: NSRect(), pressedKey: $pressedKey)
        DispatchQueue.main.async { // wait till next event cycle
            view.window?.makeFirstResponder(view)
        }
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {
    }
}
