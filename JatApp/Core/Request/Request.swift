//
//  Request.swift
//  LoginApp
//
//  Created by Dima Khymych on 17.01.2021.
//

import Foundation
protocol Request {
    func request<T:Decodable>(request:URLRequest, completion: @escaping (Result <T, ErrorHandler>) -> Void)
}


extension Request {
    
    private func decodingData <T:Decodable> (request:URLRequest,decodingType: T.Type?, completion: @escaping (T?, ErrorHandler?) -> Void) -> URLSessionDataTask {
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        return session.dataTask(with: request) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else {
                completion(nil,.requestFail)
                return
            }
            switch response.statusCode {
            case 200...299:
                guard let data = data, let decode = decodingType else {
                    completion (nil, .inavildData)
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let entity = try decoder.decode(decode, from: data)
                    completion(entity,nil)
                }catch{
                    completion (nil, .jsonParsingFail)
                }
                
            case 300...399:
                completion (nil, .requestFail)
            case 400...499:
                completion (nil, .requestFail)
            case 500...599:
                completion (nil, .requestFail)
            default:
                completion (nil, .requestFail)
            }
        }
    }
    
    func request<T:Decodable>(request:URLRequest, completion: @escaping (Result <T, ErrorHandler>) -> Void){
        decodingData(request: request, decodingType: T.self)  {(decodable, error) in
            DispatchQueue.main.async {
            if let error = error {
                    completion(Result.failure(error))
                    return}
                guard let model = decodable else {
                         completion(Result.failure(.inavildData))
                    return
                }
                completion(Result.succes(model))
            }
        }.resume()
    }
     
 }
