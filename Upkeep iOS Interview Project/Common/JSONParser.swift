//
//  JSONLoader.swift
//  Upkeep iOS Interview Project
//
//  Created by apple on 02/11/23.
//

import Foundation
import Combine

// this class for loading a json and parsing
class JSONParser {
    func loadJSON<T: Decodable>(filename: String) -> Result<T, ErrorModel> {
        guard let path = Bundle.main.path(forResource: filename, ofType: "json") else {
            return .failure(.invalidFile)
        }
        do {
            let data =  try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonDecoder = JSONDecoder()
            let response = try jsonDecoder.decode(T.self, from: data)
            return .success(response)
        }
        catch {  // error handling can be improved
            #if DEBUG
            print("Failed to map response model")
            #endif
            return .failure(.parsingError)
        }
    }
}
