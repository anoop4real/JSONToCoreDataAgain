//
//  AlbumViewModel.swift
//  JSONToCoreDataAgain
//
//  Created by anoop on 2018-11-27.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation

struct AlbumViewModel {
    
    let title: String?
    let artist: String?
    
    init(with albumItem: AlbumItem){
        // TODO: Guard'
        self.title = albumItem.title
        self.artist = albumItem.artist
    }
}
