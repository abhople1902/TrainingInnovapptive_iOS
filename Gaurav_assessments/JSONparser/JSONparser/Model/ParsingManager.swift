//
//  parsingManager.swift
//  JSONparser
//
//  Created by E5000848 on 01/06/24.
//

import Foundation

protocol ParsingManagerDelegate: AnyObject {
    func didParseData(_ parsingManager: ParsingManager, parse: ParseModel)
}


struct ParsingManager {
    
    var delegate: ParsingManagerDelegate?
    
    func performParsing(with jsonString: String) {
//        guard let safeData = Data(jsonString?.utf8 ?? "") else {
//            print("Cannot convert String to NSData")
//        }
        let safeData = Data(jsonString.utf8)
        if let parse = self.parseJSON(safeData) {
            self.delegate?.didParseData(self, parse: parse)
        }
    }
    
    func parseJSON(_ parseData: Data) -> ParseModel? {
        let decoder = JSONDecoder()
        let newTuple = ("Ayush", 2, true)
        let a = newTuple.0
        do {
            let decodedData = try decoder.decode(ParseData.self, from: parseData)
            let rName = decodedData.rName
            let tName = decodedData.tName
            let rNumber = decodedData.rNumber
            
            let ourParse = ParseModel(racerName: rName, racerNumber: rNumber, teamName: tName)
            return ourParse
        } catch {
            print(error.localizedDescription)
        }
        return ParseModel(racerName: "No data", racerNumber: 0, teamName: "No data")
    }
}
//{
//"rName": "Max",
//"tName": "Red Bull",
//"rNumber": 1
//}
