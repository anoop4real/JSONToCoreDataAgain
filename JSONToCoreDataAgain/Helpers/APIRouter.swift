//
//  APIRouter.swift
//  JSONToCoreDataAgain
//
//  Created by anoop on 2018-11-27.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation
import Alamofire

public enum APIRouter: URLRequestConvertible {
    
    static let baseURL = APIConstants.PROD.baseURL
    
    case fetchAll
    
    var method: HTTPMethod {
        switch self {
        case .fetchAll:
            return .get
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        
        let url = try APIRouter.baseURL.asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue        
        return try URLEncoding.default.encode(urlRequest, with: nil)
    }
}
