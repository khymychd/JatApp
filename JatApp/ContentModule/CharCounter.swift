//
//  CharCounter.swift
//  JatApp
//
//  Created by Dima Khymych on 20.01.2021.
//

import Foundation

protocol CharCounterProtocol {
    func countOccurrence (by string:String) -> [Character:Int]
}

class CharCounter: CharCounterProtocol {
    func countOccurrence (by string:String) -> [Character:Int] {
        var dictionary = [Character:Int]()
        let removedSpacesString = string.replacingOccurrences(of: " ", with: "")
        for char in removedSpacesString.lowercased() {
            dictionary[char] = (dictionary[char] ?? 0) + 1
        }
        return dictionary
    }
}
