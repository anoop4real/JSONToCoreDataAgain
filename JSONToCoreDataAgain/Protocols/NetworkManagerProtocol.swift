//
//  NetworkManagerProtocol.swift
//  JSONToCoreDataAgain
//
//  Created by anoop on 2018-11-27.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation

enum Result <T, E>{
    
    case success(T)
    case error(E)
}

protocol NetworkManagerProtocol {
    
    func fetchDataWith(completion: @escaping (Result<Data?, Error?>) -> Void)
}
