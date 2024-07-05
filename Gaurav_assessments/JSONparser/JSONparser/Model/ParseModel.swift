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
        case 55, 16, 4 , 11, 1:
            return true
        default:
            return false
        }
    }
}
