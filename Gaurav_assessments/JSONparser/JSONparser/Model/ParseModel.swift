//
//  parseModel.swift
//  JSONparser
//
//  Created by E5000848 on 01/06/24.
//

import Foundation

struct ParseModel {
    let racerName: String
    let racerNumber: Int
    let teamName: String
    
    var raceWins: Bool {
        switch racerNumber {
        case 55:
            return true
        case 16:
            return true
        case 4:
            return true
        case 11:
            return true
        case 1:
            return true
        default:
            return false
        }
    }
}
