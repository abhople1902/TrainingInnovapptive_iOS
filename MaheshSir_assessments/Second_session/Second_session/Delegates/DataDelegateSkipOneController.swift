//
//  DataDelegateSkipOneController.swift
//  Second_session
//
//  Created by E5000848 on 05/06/24.
//

import Foundation

protocol DataDelegateSkipOneController: AnyObject {
    func sendDataToOtherController(_ data: String?)
}

protocol IsDataSentToOtherScreen: AnyObject {
    var dataIsSent: Bool {
        get set
    }
}
