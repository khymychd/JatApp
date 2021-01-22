//
//  ErrorHandler.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import Foundation

enum ErrorHandler:Error {
    case inavildData
    case jsonParsingFail
    case requestFail
    case conversionJSONFailure
    case httpLoadFailed
    
    var localizedDescription: String {
        switch self {
        case .inavildData:
            return "Invalid Data"
        case .conversionJSONFailure:
            return "Conversion JSON is Failure"
        case .jsonParsingFail:
            return "JSON parsing is Fail"
        case .requestFail:
            return "Request is failure"
        case .httpLoadFailed:
            return "HTTP load failed"
    }
}
}
