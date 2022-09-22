//
//  NetworkService.swift
//  FlickrSwiftUI
//
//  Created by Arturo Silva Baldellon on 9/17/22.
//

import Foundation
import Resolver

protocol NetworkServiceProtocol {
    func fetch(
        with urlRequest: URLRequest,
        completion: @escaping (Result<Data, AppError>) -> Void)
}

class NetworkService {
    @Injected private var session: URLSession
}

extension NetworkService: NetworkServiceProtocol {
    func fetch(with urlRequest: URLRequest, completion: @escaping (Result<Data, AppError>) -> Void) {
        guard urlRequest.httpMethod == "GET" else {
            completion(.failure(AppError.network(description: "Something went wrong! Please try again later.")))
            return
        }
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard error == nil, let data = data else {
                completion(.failure(AppError.network(description: "Something went wrong! Please try again later.")))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
