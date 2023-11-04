//
//  ErrorModel.swift
//  CommBankAssignmentSkeleton
//
//  Created by apple on 14/04/23.
//

import Foundation

enum ErrorModel: Error {
    case invalidFile
    case parsingError
}

struct ErrorModel2: Decodable {
    let code: String
    let message: String
}
