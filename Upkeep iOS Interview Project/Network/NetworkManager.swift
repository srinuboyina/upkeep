//
//  NetworkManager.swift
//  Upkeep iOS Interview Project
//
//  Created by apple on 01/11/23.
//

import Foundation

// This class can be leveraged for network calls
// This can be converted to combine

protocol Network {
    func fetchApiData<T: Decodable>(urlString: String, completion: @escaping (T?, ErrorModel2?) -> ())
}

// can be converted to combine
class NetworkManager: Network {
    func fetchApiData<T>(urlString: String, completion:  @escaping (T?, ErrorModel2?) -> ()) where T : Decodable {
        guard let url = URL(string: urlString) else { return }
        print("*************")
        print("Endpoint url: \(url)")
        print("*************")
    
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print("Failed to get data:", err)
                completion(nil, ErrorModel2(code: "1002", message: "Couln't connect to server"))
            }
            if let error = self.checkResponse(response: response, data: data) {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
            if let responseData: T = self.handleSuccess(data: data) {
                DispatchQueue.main.async {
                    completion(responseData, nil)
                }
            }
        }.resume()
    }
    
    func handleSuccess<T: Decodable>(data: Data?) -> T? {
        guard let data = data else { return nil }
        do {
            let responseModel = try JSONDecoder().decode(T.self, from: data)
            return responseModel
        } catch let jsonErr {
            print("Failed to serialize json:", jsonErr)
        }
        return nil
    }

    func checkResponse(response: URLResponse?, data: Data?) -> ErrorModel2? {
        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode != 200 {
                let error = self.errorHandle(httpResponse: httpResponse, data: data)
                return error
            }
        }
        return nil
    }

    func errorHandle(httpResponse: HTTPURLResponse, data: Data?) -> ErrorModel2? {
        print("Status code: \(httpResponse.statusCode)")
        var error: ErrorModel2?
        guard let data = data else { return nil }
        do {
            error = try JSONDecoder().decode(ErrorModel2.self, from: data)
        }
        catch let jsonErr {
            print("Failed to serialize error in json:", jsonErr)
        }
        print("Error code : \(error?.code ?? "")")
        print("Message : \(error?.message ?? "")")
        return error
    }
}
