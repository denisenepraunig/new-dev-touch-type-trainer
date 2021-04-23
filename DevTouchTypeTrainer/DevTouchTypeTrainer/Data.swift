//
//  Data.swift
//  DevTouchTypeTrainer
//
//  Created by Denise Nepraunig on 23.04.21.
//

import Foundation

extension CGFloat {
    static let smallPadding: Self = 4
    static let bigPadding: Self = 8
}

enum TypingResult {
    case awesome
    case happy
    case neutral
    case sad
}

enum AppData {
    static let viewSize: CGFloat = 300

    // http://kaomoji.ru/en/
    static let kaomoji: [TypingResult: [String]] = [
        .awesome: ["w(°ｏ°)w", "(✯◡✯)", "٩(◕‿◕｡)۶", "(✧ω✧)", "\\(^ヮ^)/"],
        .happy: ["(=^ ◡ ^=)", "／(^ × ^)＼", "ʕ ᵔᴥᵔ ʔ", "∪＾ェ＾∪", "(„• ֊ •„)", "=＾● ⋏ ●＾="],
        .neutral: ["¯\\_(ツ)_/¯", "／(･ × ･)＼", "(￢_￢)", "ʕಠᴥಠʔ", "＼(〇_ｏ)／", "ಠ_ಠ"],
        .sad: ["／(＞×＜)＼", "ʕ •̀ o •́ ʔ", "(×﹏×)", "(T_T)", "(＃`Д´)", "(」°ロ°)」", "(╯°□°）╯︵ ┻━┻", "( ͡° ʖ̯ ͡°)"]
    ]

    static let keyHints: [Character: String] = [
        "`": "backtick",
        "~": "tilde",
        "1": "one",
        "!": "exclamation mark",
        "2": "two",
        "@": "at",
        "3": "three",
        "#": "hash",
        "4": "four",
        "$": "dollar",
        "5": "five",
        "%": "percent",
        "6": "six",
        "^": "caret",
        "7": "seven",
        "&": "ampersand",
        "8": "eight",
        "*": "multiplication",
        "9": "nine",
        "(": "left parenthesis",
        "0": "zero",
        ")": "right parenthesis",
        "-": "minus",
        "_": "underscore",
        "=": "equal",
        "+": "plus",
        "[": "left bracket",
        "{": "left curly bracket",
        "]": "right bracket",
        "}": "right curly bracket",
        "\\": "backslash",
        "|": "pipe",
        ";": "semicolon",
        ":": "colon",
        "'": "single quote",
        "\"": "double quote",
        ",": "comma",
        "<": "smaller than",
        ".": "dot",
        ">": "greater than",
        "/": "slash",
        "?": "question mark"
    ]
}
