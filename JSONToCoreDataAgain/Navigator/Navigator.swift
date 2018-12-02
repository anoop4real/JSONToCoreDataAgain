//
//  Navigator.swift
//  UIProgramatically
//
//  Created by anoop on 2018-11-28.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation

protocol Navigator {

    associatedtype Destination

    func navigate(to destination: Destination)
}
