//
//  DataStoreProtocol.swift
//  JSONToCoreDataAgain
//
//  Created by anoop on 2018-11-27.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation

protocol DataStoreProtocol {
    
    associatedtype T
    func rowsCount(for section:Int) -> Int
    func itemAt(indexPath: IndexPath) -> T?
}
