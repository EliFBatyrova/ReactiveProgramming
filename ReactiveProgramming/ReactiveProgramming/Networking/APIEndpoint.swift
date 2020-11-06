//
//  APIEndpoint.swift
//  ReactiveProgramming
//
//  Created by underq  on 06.11.2020.
//

import Foundation

struct APIEndpoint {

    var path: String = "/users"
    var queryItems: [URLQueryItem] = []
}

extension APIEndpoint {

    var url: URL {

        var components = URLComponents()

        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }

        return url
    }

    var headers: [String: Any] {
        return [:]
    }
}

extension APIEndpoint {

    static var users: Self {
        return APIEndpoint(path: "/users")
    }
}
