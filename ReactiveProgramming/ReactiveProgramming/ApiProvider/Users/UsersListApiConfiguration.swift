//
//  UserApiConfiguration.swift
//  ReactiveProgramming
//
//  Created by Amir on 27.10.2020.
//

import Moya

enum UsersListApiConfiguration {
    case users
}

extension UsersListApiConfiguration: TargetType {
    
    var baseURL: URL { URL(string: "https://jsonplaceholder.typicode.com")! }
    
    var path: String {
     
        switch self {
        case .users: return "/users"
        }
    }
    
    var method: Method {
        
        switch self {
        case .users: return .get
        }
    }
    
    var sampleData: Data { Data() }
    
    var task: Task {
        
        switch self {
        case .users: return .requestPlain
        }
    }
    
    var headers: [String : String]? { nil }
}
