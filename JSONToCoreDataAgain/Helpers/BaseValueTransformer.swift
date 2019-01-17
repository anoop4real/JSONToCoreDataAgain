//
//  BaseValueTransformer.swift
//  JSONToCoreDataAgain
//
//  Created by Anoop M on 2019-01-17.
//  Copyright © 2019 anoop. All rights reserved.
//

import Foundation
import CoreData

class BaseValueTransformer: ValueTransformer {
    
    override class func allowsReverseTransformation() -> Bool{
        return true
    }
    override func transformedValue(_ value: Any?) -> Any?{
        guard let stringValue = value as? String else {return nil}
        
        return stringValue.data(using: .utf8)?.base64EncodedData()
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any?{
        guard let data = value as? Data, let decoded = Data(base64Encoded: data) else {return nil}
        
        return String(data: decoded, encoding: .utf8)
    }
}
