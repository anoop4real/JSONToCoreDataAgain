//
//  NetworkDataManager.swift
//  JSONToCoreDataAgain
//
//  Created by anoop on 2018-11-27.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation
import Alamofire

class NetworkDataManager: NSObject{
    
    // Create a singleton
    private override init() {
        
    }
    static let _shared = NetworkDataManager()
    
    class func shared()-> NetworkDataManager{
        
        return _shared
    }
}

extension NetworkDataManager: NetworkManagerProtocol{
    
    func fetchDataWith(completion: @escaping (Result<Data?, Error?>) -> Void) {
        
        AF.request(APIRouter.fetchAll)
            .validate()
            .responseJSON { (response) in
                
                guard response.result.isSuccess else{
                    let err = NSError(domain: "Unknown", code: 0, userInfo: nil)
                    completion(.error(err))
                    return
                }
                
                guard let json = response.data else{
                    let err = NSError(domain: "Unknown", code: 0, userInfo: nil)
                    completion(.error(err))
                    return
                }
                
                completion(.success(json))
                
        }
    }
    
    
}
